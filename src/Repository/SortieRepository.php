<?php

namespace App\Repository;

use App\Entity\Sortie;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method Sortie|null find($id, $lockMode = null, $lockVersion = null)
 * @method Sortie|null findOneBy(array $criteria, array $orderBy = null)
 * @method Sortie[]    findAll()
 * @method Sortie[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SortieRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Sortie::class);
    }

    public function findBadSorties() {

        $em = $this->getEntityManager();
        // on créé la requête DQL
        $dql="SELECT *
                FROM App\Entity\Sortie s
        ";
        // on créé l'objet Query
        $query=$em->createQuery($dql);
        // retourne le résultat
        return $query->getResult();
    }

    public function findBadSites() {

        $em = $this->getEntityManager();
        // on créé la requête DQL
        $dql="SELECT *
                FROM App\Entity\Site s
        ";
        // on créé l'objet Query
        $query=$em->createQuery($dql);
        // retourne le résultat
        return $query->getResult();
    }

}
