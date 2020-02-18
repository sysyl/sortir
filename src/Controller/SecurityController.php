<?php

namespace App\Controller;

use App\Entity\Utilisateur;
use App\Form\MotPasseOublieType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class SecurityController extends AbstractController
{

    /**
     * @Route("/logout", name="logout")
     */
    public function logout()
    {
        throw new \Exception('This method can be blank - it will be intercepted by the logout key on your firewall');
    }

    /**
     * * Mot de passe oublié utilisateur
     * @Route("/mdp_oublie", name="mdp_oublie")
     * @param Request $request
     * @param EntityManagerInterface $em
     * @return Response
     * @throws \Exception
     */
    public function mdp_oublie(Request $request, EntityManagerInterface $em)
    {

        $mail = $request->request->get('mail_mdp_oublie');

        if ($mail !== null) {

            // On récupère les informations du utilisateur avec le mail
            $utilisateur = $this->getDoctrine()->getRepository(Utilisateur::class)->findOneBy(['mail' => $mail]);

            if ($utilisateur == null) {
                throw $this->createNotFoundException('Utilisateur nas pas été trouvé');
            }

            $utilisateur->setPassword($utilisateur->getPrenom() . $utilisateur->getNom());

            $token = sha1(random_bytes(32));

            $utilisateur->setToken($token);

            $em->persist($utilisateur);
            $em->flush();

        }
        return $this->render('security/mdp_oublie.html.twig');
    }

    /**
     * Mot de passe oublié utilisateur 2
     * @Route("/{id}/mdp_oublie_changer", name="mdp_oublie_changer", requirements={"id"="\d+"})
     * @param $id
     * @param Request $request
     * @param EntityManagerInterface $em
     * @param UserPasswordEncoderInterface $passwordEncoder
     * @return RedirectResponse|Response
     */
    public function mdp_oublie_changer($id, Request $request, EntityManagerInterface $em, UserPasswordEncoderInterface $passwordEncoder)
    {

        //traiter un formulaire
        $utilisateur = $em->getRepository(Utilisateur::class)->find($id);
        $MotDePasseForm = $this->createForm(MotPasseOublieType::class, $utilisateur);
        $MotDePasseForm->handleRequest($request);

        $token = $request->query->get('token');

        if ($utilisateur->getToken() == $token) {
            if ($MotDePasseForm->isSubmitted() && $MotDePasseForm->isValid()) {
                $utilisateur->setPassword(
                    $passwordEncoder->encodePassword(
                        $utilisateur,
                        $utilisateur->getPassword()
                    )
                );
                $utilisateur->setToken(null);
                $em->persist($utilisateur);
                $em->flush();
                $this->addFlash('success', "Votre mot de passe a été modifié");
                return $this->redirectToRoute('app_login',['last_username'=>$utilisateur->getMail()]);
            }
        } else {
            return $this->redirectToRoute('app_login');
        }

        return $this->render("profil/modification_mdp.html.twig", [
            'MotDePasseForm' => $MotDePasseForm->createView(),
            'utilisateur' => $utilisateur
        ]);
    }

}
