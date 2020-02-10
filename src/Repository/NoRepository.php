<?php

namespace App\Repository;

use App\Entity\No;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method No|null find($id, $lockMode = null, $lockVersion = null)
 * @method No|null findOneBy(array $criteria, array $orderBy = null)
 * @method No[]    findAll()
 * @method No[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class NoRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, No::class);
    }
}
