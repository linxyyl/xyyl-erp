<?php


namespace suck\newtype;

use Doctrine\DBAL\Platforms\AbstractPlatform;
use Doctrine\DBAL\Types\Type;

/*    $generator = new MigrateGenerator('thinkphp');
    $generator->registerNewType([
        'set' => SetType::class,
    ]);*/

/**
 * 新增迁移字段;类型
 * Class SetType
 * @package suck\newtype
 */
class SetType extends Type
{
    public const SET = 'set';

    public function getSQLDeclaration(array $fieldDeclaration, AbstractPlatform $platform)
    {
        return $platform->getIntegerTypeDeclarationSQL($fieldDeclaration);
    }

    public function getName()
    {
        return static::SET;
    }
}