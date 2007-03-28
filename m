From: Ignatich <ignatich@gmail.com>
Subject: reiser4: reserved disk space
Date: Wed, 28 Mar 2007 16:29:14 +0400
Message-ID: <460A5F9A.6070902@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30624-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:content-type:content-transfer-encoding;
        b=bHWY7HMfMCmTBJCRd5wppIpNBYDl1WCWxA7XbUXdqJJSBqb+RuATV3M6LCJWqT//8PJAbY9cS7PEgarb0XzO2D3kkG+I0Ym4JwFuPAL5Cd+1c+d9hikWb46iDHYq4/Z/EJZoD+Xo3eRQM4pIR9rJFIZh9N6Rp2dqbFhQS1bPbz4=
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Reiser4 reserves roughly 5% of partition size for it's internal use. 
This space can be tens of gigabytes for modern hard disks, and unlike 
ext2 reserve cannot be used even by root in any way.

I changed reserved block count in super.c to be 1% instead of 5%, 
formatted a test drive in reiser4 and stress tested it by copying many 
small or few huge files to almost full disk. Everything was working fine.

It there a reason for this reserve to be so big?
