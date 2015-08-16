From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH 0/3] reiser4progs: metadata checksums
Date: Sun, 16 Aug 2015 15:23:09 +0200
Message-ID: <55D08EBD.4020406@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=/KfHrHkltefJ4Rt/vLa6kbYyPdGlV0bd/BcooJdQMzQ=;
        b=W1XYQUOhqREMe8JA9R2OO+Bn+7Z/hM5Uz54j/2ptXOWyq4LwQeKtz5fIlvdHucy00d
         fevVwpQN4ENWuXSB+Md3wXMrU/T996tnMhl2da6nUQuOSq0uUrkDSK0s8tgh+wWXsIg2
         PwVWUQ3Gg1nUtf9Ij7Lc0qE7FrSpeszW5EXZ2/Wnk+azkVOIsm8f05IWTct7QUFJr7wz
         t3rdpqdZPyEbcJ+vabg5LPGNz+m0ASXx3Ga/27Ck6RJZMh+sCABHzn6dg6Ekeg94RZQ2
         Vp5JTU8cRrjDd16YZcQnSdFcbXiCO3j76EhmxtbJ9swWTA9Phs8CA+iSpxR0uxP98u87
         Km/g==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This patch series is against reiser4progs-1.0.9-add-node41-support.patch
Find at: http://sourceforge.net/projects/reiser4/files/patches/
Can be easily forward ported to more fresh stuff.

NOTE: The patched package provides utilities of format release number 4.0.1.
WARNING: For testing only!!!
