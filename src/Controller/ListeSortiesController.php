<?php

namespace App\Controller;

use App\Entity\Etat;
use App\Entity\Rejoindre;
use App\Entity\Site;
use App\Entity\Sortie;
use App\Entity\Ville;
use App\Form\SiteType;
use App\Form\VilleType;
use DateTime;
use DateTimeZone;
use Doctrine\ORM\EntityManagerInterface;
use Exception;
use PhpParser\Node\Stmt\Foreach_;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ListeSortiesController extends AbstractController
{
    /**
     * @Route("/liste_sorties", name="liste_sorties")
     * @param EntityManagerInterface $emi
     * @return Response
     * @throws Exception
     */
    public function index(EntityManagerInterface $emi)
    {

        // LES ETATS
        $etatCree = $emi->getRepository( Etat::class)->findOneBy(['libelle' => 'Brouillon']);
        $etatPublie = $emi->getRepository( Etat::class)->findOneBy(['libelle' => 'Publiée']);
        $etatAnnule = $emi->getRepository( Etat::class)->findOneBy(['libelle' => 'Annulée']);
        $etatCloture = $emi->getRepository( Etat::class)->findOneBy(['libelle' => 'Clôturée']);
        $etatEncours = $emi->getRepository( Etat::class)->findOneBy(['libelle' => 'En cours']);
        $etatTermine = $emi->getRepository( Etat::class)->findOneBy(['libelle' => 'Terminée']);
        $etatArchive = $emi->getRepository( Etat::class)->findOneBy(['libelle' => 'Archivée']);

        // TOUTE LES VILLES
        $villes = $emi->getRepository(Ville::class)->findAll();

        // LES REQUETES DE RECUPERATIONS DES SORTIES EN FONCTION DE L'ETAT
        $sortiesPubliees = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatPublie]);
        $sortiesCreees = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatCree, 'organisateur' => $this->getUser()]);
        $sortiesAnnulees = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatAnnule]);
        $sortiesCloturees = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatCloture]);
        $sortiesEncours = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatEncours]);
        $sortiesTerminees = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatTermine]);
        $sortiesArchivees = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatArchive]);

//        //LES DATES
        $localDate = new DateTime("now");
        foreach ($sortiesAnnulees as $laSortieAnnulee) {
            $interval = date_diff($laSortieAnnulee->getDateHeureDebut(), $localDate);

            if($interval->format('%R%a') >= '+30'){

                $laSortieAnnulee->setEtat($etatArchive);
                $emi->persist($laSortieAnnulee);
                $emi->flush();
            }
        }

        foreach ($sortiesCloturees as $laSortieCloturee) {
            $interval = date_diff($laSortieCloturee->getDateHeureDebut(), $localDate);

            if($interval->format('%R%a') >= '+30'){
                $laSortieCloturee->setEtat($etatArchive);
                $emi->persist($laSortieCloturee);
                $emi->flush();
            }
        }

        foreach ($sortiesTerminees as $laSortieTerminee) {
            $interval = date_diff($laSortieTerminee->getDateHeureDebut(), $localDate);

          if($interval->format('%R%a') >= '+30'){
              $laSortieTerminee->setEtat($etatArchive);
              $emi->persist($laSortieTerminee);
              $emi->flush();
            }
        }

      foreach ($sortiesPubliees as $laSortiePlublier) {
          $interval = date_diff($laSortiePlublier->getDateHeureDebut(), $localDate);
          //dump($interval->format('%ad %hh %im').'.........');
          $TEST = $laSortiePlublier->getDuree();


          //==========
          $hours =  floor($TEST/60);
          if($hours<10){
              $hours = '0'.$hours;
          }
          $mins =   $TEST % 60;
          $convertor = $hours.'h'.' '.$mins.'m';
          //==========

          //dump($convertor);
          $localDate->format('H\h i\m');
          //dump($laSortiePlublier->getDateHeureDebut());
           if($interval->format("%ad %hh")=='0d 0h'){
               dump($interval->format("%a"));
                   if(date('Y-m-d H:i',strtotime(   '+'.$hours.' hour +'.$mins.'minutes',strtotime($laSortiePlublier->getDateHeureDebut()->format('Y-m-d H:i')))) > $localDate->format('Y-m-d H:i')){
                       dump($laSortiePlublier);
                       $laSortiePlublier->setEtat($etatEncours);
                       $emi->persist($laSortiePlublier);
                       $emi->flush();
                   }

            }
           /*
            *    if(){
                   dump($laSortiePlublier);
                   $laSortiePlublier->setEtat($etatTermine);
                   $emi->persist($laSortiePlublier);
                   $emi->flush();
            */


        }
      foreach ($sortiesEncours as $laSortieEncours){
          $interval = date_diff($laSortieEncours->getDateHeureDebut(), $localDate);
          dump(540/60);
          $TEST = $laSortieEncours->getDuree();


          //==========
          $hours =  floor($TEST/60);
          if($hours<10){
              $hours = '0'.$hours;
          }
          $mins =   $TEST % 60;
          $convertor = $hours.'h'.' '.$mins.'m';
          //==========

          //dump($convertor);
          $localDate->format('H\h i\m');
          //dump(date('Y-m-d H:i',strtotime(   '+'.$hours.' hour +'.$mins.'minutes',strtotime($laSortieEncours->getDateHeureDebut()->format('Y-m-d H:i')))));
              if(date('Y-m-d H:i',strtotime(   '+'.$hours.' hour +'.$mins.'minutes',strtotime($laSortieEncours->getDateHeureDebut()->format('Y-m-d H:i')))) < $localDate->format('Y-m-d H:i')){
                  dump($laSortieEncours);
                  $laSortieEncours->setEtat($etatTermine);
                  $emi->persist($laSortieEncours);
                  $emi->flush();
              }


      }

        $sortiesPhone = $emi->getRepository(Sortie::class)->findBy(['etat' => [$etatCree, $etatPublie, $etatCloture, $etatEncours, $etatTermine], 'site' => $this->getUser()->getSite()]);

        $rejoindres = $emi->getRepository(Rejoindre::class)->findBy(['sonUtilisateur' => $this->getUser()]);

        return $this->render('liste_sorties/liste.html.twig', [
            'controller_name' => 'ListeSortiesController',
            'sortiesPubliees' => $sortiesPubliees,
            'sortiesCreees' => $sortiesCreees,
            'sortiesAnnulees' => $sortiesAnnulees,
            'sortiesCloturees' => $sortiesCloturees,
            'sortiesEncours' => $sortiesEncours,
            'sortiesTerminee' => $sortiesTerminees,
            'sortiesArchivees' => $sortiesArchivees,
            'rejoindres' => $rejoindres,
            'villes' => $villes,
            'sortiesPhone' => $sortiesPhone
        ]);
    }

    /**
     * Rejoindre une Sortie
     * @Route("/rejoindre_sortie/{id}", name="rejoindre_sortie")
     * @param EntityManagerInterface $emi
     * @param Sortie $sortie
     * @param Request $request
     * @return RedirectResponse
     * @throws Exception
     */
    public function rejoindre(EntityManagerInterface $emi, Sortie $sortie, Request $request)
    {
        $referer = $request->headers->get('referer');

        //recuperer en base de données
        $sortieRepo = $this->getDoctrine()->getRepository(Rejoindre::class)->findOneBy(['sonUtilisateur'=>$this->getUser(), 'saSortie'=>$sortie]);

        if ($sortieRepo !== null) {
            $this->get('session')->getFlashBag()->add('warning', "Vous êtes déja inscrit à la sortie ...");
            return $this->redirectToRoute("liste_sorties");
        }

        $rejoindre = new Rejoindre();

        $rejoindre->setSonUtilisateur($this->getUser());

        $sortie->setNbInscrits($sortie->getNbInscrits()+1);
        if ($sortie->getNbInscrits() == $sortie->getNbInscriptionMax()) {
            $etatCloturee = $emi->getRepository(Etat::class)->findOneBy(['libelle'=>'Clôturée']);
            $sortie->setEtat($etatCloturee);
        }
        $rejoindre->setSaSortie($sortie);
        $rejoindre->setDateInscription(new DateTime());

            //sauvegarder les données dans la base

            $emi->persist($rejoindre);
            $emi->flush();

        $this->get('session')->getFlashBag()->add('success', "Vous vous êtes inscrit à cette sortie !");

        return $this->redirect($referer);
    }

    /**
     * Se désister d'une Sortie
     * @Route("/desister_sortie/{id}", name="desister_sortie")
     * @param Request $request
     * @param EntityManagerInterface $emi
     * @param Sortie $sortie
     * @return RedirectResponse
     */
    public function desister(Request $request, EntityManagerInterface $emi, Sortie $sortie)
    {
        $referer = $request->headers->get('referer');

        //recuperer en base de données
        $sortieRepo = $this->getDoctrine()->getRepository(Rejoindre::class)->findOneBy(['sonUtilisateur'=>$this->getUser(), 'saSortie'=>$sortie]);

        if ($sortieRepo !== null) {

            $sortie->setNbInscrits($sortie->getNbInscrits()-1);

            if ($sortie->getNbInscrits() < $sortie->getNbInscriptionMax()) {
                $etatPubliee = $emi->getRepository(Etat::class)->findOneBy(['libelle'=>'Publiée']);
                $sortie->setEtat($etatPubliee);
            }

            $emi->remove($sortieRepo);
            $emi->flush();

            $this->get('session')->getFlashBag()->add('success', "Vous vous êtes désisté de la sortie");
            return $this->redirect($referer);
        }

        $this->get('session')->getFlashBag()->add('danger', 'Erreur lors de la tentative de se désister de cette sortie.');
        return $this->redirect($referer);
    }

    /**
     * @Route("/liste_villes", name="liste_villes")
     * @param EntityManagerInterface $emi
     * @return Response
     */
    public function listeVilles(EntityManagerInterface $emi)
    {
        // TOUTE LES VILLES
        $villes = $emi->getRepository(Ville::class)->findAll();

        return $this->render('liste_sorties/listeVilles.html.twig', [
            'controller_name' => 'ListeSortiesController',
            'villes' => $villes
        ]);
    }

    /**
     * @Route("/liste_sites", name="liste_sites")
     * @param EntityManagerInterface $emi
     * @return Response
     */
    public function listeSites(EntityManagerInterface $emi)
    {
        // TOUTE LES SITES
        $sites = $emi->getRepository(Site::class)->findAll();

        return $this->render('liste_sorties/listeSites.html.twig', [
            'controller_name' => 'ListeSortiesController',
            'sites' => $sites
        ]);
    }

    /**
     * Supprimer une ville
     * @Route("/deleteVille/{id}", name="ville_delete")
     * @param EntityManagerInterface $em
     * @param $id
     * @return RedirectResponse
     */
    public function deleteVille(EntityManagerInterface $em, $id) {

        $ville = $em->getRepository(Ville::class)->find($id);

        if($ville == null) {
            throw $this->createNotFoundException('La ville est inconnu ou déjà supprimée');
        }
        $em->remove($ville);
        $em->flush();
        $this->addFlash('success', 'La ville est supprimé');

        return $this->redirectToRoute("admin");
    }

    /**
     * Supprimer un Site
     * @Route("/deleteSite/{id}", name="site_delete")
     * @param Request $request
     * @param EntityManagerInterface $em
     * @param $id
     * @return RedirectResponse
     */
    public function deleteSite(Request $request, EntityManagerInterface $em, $id) {

        $site = $em->getRepository(Site::class)->find($id);

        if($site == null) {
            throw $this->createNotFoundException('Le Site est inconnu ou déjà supprimée');
        }
        $em->remove($site);
        $em->flush();
        $this->addFlash('success', 'Le Site est supprimé');

        return $this->redirectToRoute("admin");
    }

    /**
     * Modifier une ville
     * @Route("/{id}/editVille", name="ville_edit", requirements={"id"="\d+"})
     * @param $id
     * @param Request $request
     * @param EntityManagerInterface $em
     * @return RedirectResponse|Response
     */
    public function editVille($id, Request $request, EntityManagerInterface $em) {

        //traiter un formulaire
        $ville = $em->getRepository(Ville::class)->find($id);
        $villeForm = $this->createForm(VilleType::class, $ville);
        $villeForm->handleRequest($request);

        if($villeForm->isSubmitted() && $villeForm->isValid()) {

            $em->persist($ville);
            $em->flush();
            $this->addFlash('success', "La vile a été modifié");

            return $this->redirectToRoute("admin", [
                'option' => 'Villes'
            ]);
        }
        return $this->render("sortie/editVille.html.twig", [
            'villeForm' => $villeForm->createView()
        ]);

    }

    /**
     * Modifier un Site
     * @Route("/{id}/editSite", name="site_edit", requirements={"id"="\d+"})
     * @param $id
     * @param Request $request
     * @param EntityManagerInterface $em
     * @return RedirectResponse|Response
     */
    public function editSite($id, Request $request, EntityManagerInterface $em) {

        //traiter un formulaire
        $site = $em->getRepository(Site::class)->find($id);
        $siteForm = $this->createForm(SiteType::class, $site);
        $siteForm->handleRequest($request);

        if($siteForm->isSubmitted() && $siteForm->isValid()) {

            $em->persist($site);
            $em->flush();
            $this->addFlash('success', "Le site a été modifié");

            return $this->redirectToRoute("admin", [
                'option' => 'Sites'
            ]);

        }
        return $this->render("sortie/editSite.html.twig", [
            'siteForm' => $siteForm->createView()
        ]);

    }

    //ABANDONNES
//    /**
//     * Filtre
//     * @Route("/liste_sorties/filter/{value}", name="liste_sorties_filtered")
//     * @param $value
//     * @param EntityManagerInterface $emi
//     * @return RedirectResponse|Response
//     */
//    public function filter($value, EntityManagerInterface $emi) {
//
//        $coucou = [];
//
//        // LES ETATS
//        $etatCreee = $emi->getRepository( Etat::class)->findOneBy(['libelle' => 'Brouillon']);
//        $etatPubliee = $emi->getRepository( Etat::class)->findOneBy(['libelle' => 'Publiée']);
//        $etatAnnule = $emi->getRepository( Etat::class)->findOneBy(['libelle' => 'Annulée']);
//        $etatCloture = $emi->getRepository( Etat::class)->findOneBy(['libelle' => 'Clôturée']);
//        $etatEncours = $emi->getRepository( Etat::class)->findOneBy(['libelle' => 'En cours']);
//        $etatTerminee = $emi->getRepository( Etat::class)->findOneBy(['libelle' => 'Terminée']);
//        $etatArchive = $emi->getRepository( Etat::class)->findOneBy(['libelle' => 'Archivée']);
//
//        // TOUTE LES VILLES
//        $villes = $emi->getRepository(Ville::class)->findAll();
//        $rejoindres = $emi->getRepository(Rejoindre::class)->findBy(['sonUtilisateur' => $this->getUser()]);
//        $sortiesPhone = $emi->getRepository(Sortie::class)->findBy(['etat' => [$etatCreee, $etatPubliee, $etatCloture, $etatEncours, $etatTerminee], 'site' => $this->getUser()->getSite()]);
//
//        switch ($value) {
//            case "Organizer":
//                // LES REQUETES DE RECUPERATIONS DES SORTIES EN FONCTION DE L'ETAT
//                $sortiesPubliees = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatPubliee, 'organisateur' => $this->getUser()]);
//                $sortiesCreees = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatCreee, 'organisateur' => $this->getUser()]);
//                $sortiesAnnulees = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatAnnule, 'organisateur' => $this->getUser()]);
//                $sortiesCloturees = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatCloture, 'organisateur' => $this->getUser()]);
//                $sortiesEncours = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatEncours, 'organisateur' => $this->getUser()]);
//                $sortiesTerminees = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatTerminee, 'organisateur' => $this->getUser()]);
//                $sortiesArchivees = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatArchive, 'organisateur' => $this->getUser()]);
//                break;
//            case "Registered":
//                for ($i = 0; $i < sizeof($rejoindres); $i++) {
//                    $sortiesPubliees = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatPubliee, 'id' => $rejoindres[$i]->getSaSortie()]);
//                    $sortiesCreees = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatCreee, 'id' => $rejoindres[$i]->getSaSortie()]);
//                    $sortiesAnnulees = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatAnnule, 'id' => $rejoindres[$i]->getSaSortie()]);
//                    $sortiesCloturees = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatCloture, 'id' => $rejoindres[$i]->getSaSortie()]);
//                    $sortiesEncours = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatEncours, 'id' => $rejoindres[$i]->getSaSortie()]);
//                    $sortiesTerminees = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatTerminee, 'id' => $rejoindres[$i]->getSaSortie()]);
//                    $sortiesArchivees = $emi->getRepository(Sortie::class)->findBy(['etat' => $etatArchive,'id' => $rejoindres[$i]->getSaSortie()]);
//                    $coucou = $i;
//                }
//                break;
//            case "NotRegistered":
//                break;
//        }
//
//        return $this->render('liste_sorties/liste.html.twig', [
//
//            'controller_name' => 'ListeSortiesController',
//            'sortiesPubliees' => $sortiesPubliees,
//            'sortiesCreees' => $sortiesCreees,
//            'sortiesAnnulees' => $sortiesAnnulees,
//            'sortiesCloturees' => $sortiesCloturees,
//            'sortiesEncours' => $sortiesEncours,
//            'sortiesTerminee' => $sortiesTerminees,
//            'sortiesArchivees' => $sortiesArchivees,
//            'rejoindres' => $rejoindres,
//            'villes' => $villes,
//            'sortiesPhone' => $sortiesPhone
//        ]);
//    }
}
