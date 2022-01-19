<?php
Yii::import('application.modules.mail.models.*');
Yii::import('application.modules.mail.models.form.CallbackEmailModal');

class CallbackEmailWidget extends yupe\widgets\YWidget
{
    public $view = 'callback-widget';


    public function run()
    {
        $model = new CallbackEmailModal;
        if (isset($_POST['CallbackEmailModal'])) {
            $model->attributes = $_POST['CallbackEmailModal'];
            if ($model->verify == '') {
                if ($model->validate()) {
                    Yii::app()->user->setFlash('success2', 'Ваше сообщение успешно отправлено');
                    Yii::app()->controller->refresh();
                }
            }
        }
        $this->render($this->view, [
            'model' => $model,
            // 'sucssesId' => $sucssesId,
        ]);
    }
}
