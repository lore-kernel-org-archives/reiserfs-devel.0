From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-3.7
Date: Sun, 06 Jan 2013 21:42:10 +0100
Message-ID: <50E9E1A2.4040400@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=bbiJNb3QlI2JmQcvSjWoy0BWxbW3SkNsT31pQmuycoA=;
        b=HZ5yoOegI9URIANCMSvNh+eSVvvy+pXUq93Uqnc+p/9fO+r2xc12nIgN6rZ7AiFJjF
         SJ+8nH1ReRlCBAS4jnR8po2AbmEW8zilQiFHA/EtZ/UvozbiCPiq+kV+pIHr2L18Wj8N
         1oj39i4x4T6E0k3pJSxdNkXPkLWgjLk3/OfX1AZtHynqTzg+2dHEpCjWw3I61HtQWnj4
         ITJn27zAMe7JIVv0nanOy3ZQwWOjUdqqgSdUrrS/MqQkZhx/r2XoJZlElKyhQ5tf3ZID
         SxVRT3MdjDOi/0b3PNHBTy4HeubgMhS/VYC+KvAslcqSa2MEaT25MatPCflWDveiaM0Z
         mivg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Changes since 3.6:

Ivan Shapovalov

. Port for linux-3.7;
. make reiser4 mapping not movable (always fail migration).

Edward Shishkin

. Ifdef reiser4_migratepage to prevent compilation error
   in the case when CONFIG_MIGRATION is not defined;
. Use separate foo_bugop() instead of the common bugop()
   to understand in what stub the oops occured;
. Don't set zeros to the body of ctail item in debug mode
   (where extra-modifications are highly undesirable);
. Use "dispatch" prefix for file operations, which pass
   management to FILE plugins in accordance with inode's
   plugin table (pset);
. Update comments.

Please, find here:
http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.x/

Thanks,
Edward.
