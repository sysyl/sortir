<?php

namespace App\Repository;

use App\Entity\Rejoindre;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method Rejoindre|null find($id, $lockMode = null, $lockVersion = null)
 * @method Rejoindre|null findOneBy(array $criteria, array $orderBy = null)
 * @method Rejoindre[]    findAll()
 * @method Rejoindre[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class RejoindreRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Rejoindre::class);
    }
}
