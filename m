From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 updates
Date: Mon, 17 Aug 2020 15:04:39 +0200
Message-ID: <179a498d-7ace-a9fc-6940-f5f8fbc94f73@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=rylnFXFRMsFq/M07NKRObHgqYvpKLkSpKB6ByDu7GGU=;
        b=GhL2BZcRUU40xKzdxzUyLqbwgFWRRbZAvr1JfzXZfmbOCV9QY0NFrWgU4dEvsD9xRb
         diiOB/i//qdGvKlqATDd8v9QB0lBluJhUuKClpfvyn3r+4/CIzPQw5YUwbWQpS9z5b2Z
         Xk9FRavlti/51U0gWjQ+t4Dw4tVgITQTGejDHa6nSk5VrB7vV/kUITezyHHPlbEkkRxg
         VSf41ZWZZmYI3iNsMmAhbVgdq7oc4/CTjiHfrAtVBo3PPE6AT1s0kOh1zZB0vQhZI8NN
         lcFETFX9OQXDWuC/u7jcRH3t22x2/I5L2ROffDmAxK6V0EIckNqeQiXhsPJ1myFxJb+V
         FHlQ==
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

4.0.2 (stable - simple volumes):

- Port for Linux-5.8

Download at 
https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-5.x/

5.1.3 (experimental - logical volumes):

   Kernel:

   - Fixups in common volume balancing procedure
   - Port for Linux-5.8

   Download at 
https://sourceforge.net/projects/reiser4/files/v5-unstable/kernel/

   Userspace:

   - Reiser4progs-2.0.3 release:

     . fixups in progs/volume/volume.c
     . fixed documentation
     . added manual page for volume.reiser4 utility

   Download at 
https://sourceforge.net/projects/reiser4/files/v5-unstable/progs/
