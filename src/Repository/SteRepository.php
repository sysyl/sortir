<?php

namespace App\Repository;

use App\Entity\Ste;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method Ste|null find($id, $lockMode = null, $lockVersion = null)
 * @method Ste|null findOneBy(array $criteria, array $orderBy = null)
 * @method Ste[]    findAll()
 * @method Ste[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SteRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Ste::class);
    }
}
