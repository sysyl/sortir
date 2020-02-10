<?php

namespace App\Form;

use App\Entity\Utilisateur;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class UtilisateurType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('nom')
            ->add('prenom')
            ->add('telephone')
            ->add('mail')
            ->add('admin')
            ->add('actif')
            ->add('password')
            ->add('pictureFilename')
            ->add('publicationParSite')
            ->add('OrganisateurInscriptionDesistement')
            ->add('administrateurPublication')
            ->add('pseudo')
            ->add('administrationModification')
            ->add('notifVeilleSortie')
            ->add('token')
            ->add('site')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Utilisateur::class,
        ]);
    }
}
