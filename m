From: "dE ." <de.techno@gmail.com>
Subject: init segfault.
Date: Thu, 20 Sep 2012 12:36:51 +0530
Message-ID: <505AC08B.6050903@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=W2VZj7D3cqDUtyjGuPNbwL9nEDj31RyySFZfTNU/rSQ=;
        b=cNurDS8cQMIfJy1PzrU1D6fgbtJwcDJoTL9zx9XqGImpzQPy3z3pIWOxRCXpPIXcYO
         cSJYGm65QClSq/DDZ7Hn4Lumn4gGxWJC3n5n8T/GIDC0vDG1+fgf6EUTHxGEelRl6UoY
         h3BTbd8hZO7jw1ANuDDeFKcUAwKyzk9VDK/OFJBpO+dKVNNbaTs9/AsrkATXei+xtHqp
         cftp3YZB0UJpfvCLhCXQTD1RtvtswilN3eJWjJ0WZHpKQ4MBGMflmMjU7q59VFl35VD1
         PVx8/vaqEa5VEMoz9tNfrbtEuMi12e+ktbHUaqvO2NoPS6deTcpcqJg0IlvdnrFcY0KO
         d9YA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Is anyone using reiser4 on their rootfs?

Well, yeah I stated I wont try it on root FS with compression, but I did 
(on a backup) :P

The result is that, init ends up with a segfault.

How can I help debug?
