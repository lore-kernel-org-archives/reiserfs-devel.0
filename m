From: Anders Aagaard <aagaande@gmail.com>
Subject: Correct fsck behavior on boot
Date: Thu, 11 Sep 2008 13:26:02 +0200
Message-ID: <48C9004A.5080504@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=Qz31QylQd8J/JtVKw/CEEveY10HLntUh9vZCkuNqgEs=;
        b=h+QREJ2DWiGH1nFJtjZTReV2k9BRyKY7DQcOkXIOeMmY+0vrBYCDKS6yAVID7VP83i
         q+DprSNpkvE+GZpwZ7zidiv2X8JrchDkBDEtn5v+htZXKBcndm6dmufYqlnXAxcxtkXQ
         Tkv+GVRApL/nWvT86gCxIEpUYMzyZuH3mmlpE=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Hi

What's the correct options to pass to reiser4.fsck on boot to get it to 
check the filesystem when it's not marked as clean?

reiser4 fsck does implement -a, but it seems to return right away, 
including when the filesystem wasn't unmounted cleanly.  Is the 
filesystem integrity still secured by hash'es, so skipping fsck is 
intentional?
--check --fix seems a tad bit excessive on every boot.

Anders Aagaard
