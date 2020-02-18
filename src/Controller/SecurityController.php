<?php

namespace App\Controller;

use App\Entity\Utilisateur;
use App\Form\MotPasseOublieType;
use Doctrine\ORM\EntityManagerInterface;
use Exception;
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
        throw new Exception('This method can be blank - it will be intercepted by the logout key on your firewall');
    }

    /**
     * * Mot de passe oublié utilisateur
     * @Route("/mdp_oublie", name="mdp_oublie")
     * @param Request $request
     * @param EntityManagerInterface $em
     * @param UserPasswordEncoderInterface $passwordEncoder
     * @return Response
     * @throws Exception
     */
    public function mdp_oublie(Request $request, EntityManagerInterface $em, UserPasswordEncoderInterface $passwordEncoder)
    {

        $mail = $request->request->get('mail_mdp_oublie');

        if ($mail !== null) {

            // On récupère les informations du utilisateur avec le mail
            $utilisateur = $this->getDoctrine()->getRepository(Utilisateur::class)->findOneBy(['mail' => $mail]);

            if ($utilisateur == null) {
                throw $this->createNotFoundException('Utilisateur nas pas été trouvé');
            }

            $utilisateur->setPassword($passwordEncoder->encodePassword($utilisateur,$utilisateur->getPrenom().$utilisateur->getNom()));

            $token = sha1(random_bytes(32));
            $utilisateur->setToken($token);

            $em->persist($utilisateur);
            $em->flush();

        }
        return $this->render('security/mdp_oublie.html.twig');
    }

}
