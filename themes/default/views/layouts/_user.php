
        <?php if (Yii::app()->user->isGuest): ?>
            <a class="header-pc__login" href="<?= Yii::app()->createUrl('user/account/login'); ?>">
                <span class="input-pc">Войти</span>
            </a>
            <?php else: ?>
            <a class="header-pc__login link-profile" href="<?= Yii::app()->createUrl('user/profile/index'); ?>">
                <div class="profile-name">
                    <?= Yii::app()->user->getProfile()->getFirstLetterName(); ?>
                </div>
            </a>
        <?php endif ?>
