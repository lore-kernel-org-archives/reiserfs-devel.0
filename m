From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-4.9
Date: Sat, 17 Dec 2016 18:44:18 +0100
Message-ID: <2c948996-4549-1c54-d5e4-2ec3a40d896a@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=2f2y9nJqLakNpLs3s0ZQP+guxzPYpvQixk68JeMvE8Y=;
        b=rYP6Y56gtSoCzoljfjU229tTBQfHRjWc82dmHtfHuXFlbsGErUVZlBYcz5HU3jmZ9I
         s28JmKgdB1mSzetEAlOvIaykF34ombwrdCusA5+2pHEXVU9wnxGRJ/K/MdeQtORxeMUr
         WRcP6QbXo+KxLkCv/f0cJY1rTloJ4gh0Dwd6Y3S/3k704mxTx26+SuMwWBUHzRAHglad
         hXj6TSD1UP5WatfUnlpgZuWN70h83p0alYZawQ9awCg2O6gUuLz2b9/UUHap/8lSAn1e
         oQhNUxzUWKT2gmfZIPY1UuLsG2PojlMWX0zqKnQuO3LiWiWTQbKDUcOaktoVa/WPKuXT
         0UDw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Hello everyone,

So with the latest commit 4e09135f2832b66b62f9a974172149ebbca4eea7
our mirrors (RAID-1) stuff looks stable, so I think we'll merge the
development branch "format41" to the stable one ("master") soon.

The next feature that we are going to implement is distribution of
read I/O requests among all mirrors. It will essentially speedup read
operations in the case when mirrors are on different devices.

Please, find here:

https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-4.x/
https://github.com/edward6/

Thanks,
Edward.
