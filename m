From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 8/8 v2]tuners:tuner-simple Fix warning: variable 'tun' set but not used
Date: Mon, 14 Jun 2010 22:48:34 -0700
Message-ID: <1276580914-21883-1-git-send-email-justinmattock@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=d/U+rE39j5XYPQGrtDq4JKn5tkyI2EKHC1a6nPU1Ies=;
        b=IqrTEpyLGtc/YclhR3US7T1JWWjmJyixdmFLWTCb6+AL9RDBtQR3YIHTIlyhUdKEIP
         RZWv1Gl2JgHrVV9yhTKu1TMfdffeCQeqx4IVXEqawu6h8xQKsjx7CdyiNFemYKOQ9sbd
         t1jB/uu34YyuVBITZZKyPFLuYEV4jSGc7N+vc=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: mchehab@redhat.com, linux-kernel@vger.kernel.org, "Justin P. Mattock" <justinmattock@gmail.com>

Resend due to a whitespace issue I created by mistake.
The below patch fixes a warning message create by gcc 4.6.0
 
 CC [M]  drivers/media/common/tuners/tuner-simple.o
drivers/media/common/tuners/tuner-simple.c: In function 'simple_set_tv_freq':
drivers/media/common/tuners/tuner-simple.c:548:20: warning: variable 'tun' set but not used

 Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>
 Reviewed-By: Mauro Carvalho Chehab <mchehab@redhat.com>

---
 drivers/media/common/tuners/tuner-simple.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/media/common/tuners/tuner-simple.c b/drivers/media/common/tuners/tuner-simple.c
index 8abbcc5..84900fa 100644
--- a/drivers/media/common/tuners/tuner-simple.c
+++ b/drivers/media/common/tuners/tuner-simple.c
@@ -545,14 +545,11 @@ static int simple_set_tv_freq(struct dvb_frontend *fe,
 	struct tuner_simple_priv *priv = fe->tuner_priv;
 	u8 config, cb;
 	u16 div;
-	struct tunertype *tun;
 	u8 buffer[4];
 	int rc, IFPCoff, i;
 	enum param_type desired_type;
 	struct tuner_params *t_params;
 
-	tun = priv->tun;
-
 	/* IFPCoff = Video Intermediate Frequency - Vif:
 		940  =16*58.75  NTSC/J (Japan)
 		732  =16*45.75  M/N STD
-- 
1.7.1.rc1.21.gf3bd6

