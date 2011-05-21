From: dE <de.techno@gmail.com>
Subject: reiser4 + loop + NFS = disaster.
Date: Sat, 21 May 2011 21:39:45 +0530
Message-ID: <4DD7E3C9.3030103@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=sdlHxPsPR6wWjWiJj5WpZzQEqQukaD/WlG8vYRnQhSQ=;
        b=sBhRYaL6tSx10hIzdzF5IQBx/lWNj6917GWS5m85yi2RtrFXfuWW8Im6xs5y1aOF32
         z56pHEXikZIa1ac5oMsUajQXTY6ppqmyZCwfUBje4Gg9R8K9MQmjK6yh4NYW86M8RKO2
         zVXmbl9gsoQqmF6tx6/IuABdENAFnmgHBfW1k=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

I've been trying to loop mount reiser4 which resides on a file on an 
exported NFS partition, it mounts fine but when copying a lot of small 
files inside a complex directory tree everything just hangs all of a 
sudden, in fact the whole share hangs. Any operation on the share 
(including bash completion) will hang bash (or in that case any 
application) completely.

Doing the same will work with any other FS. Parameters for reiser4 -

create=ccreg40,compress=gzip1,compressMode=force,fibration=lexic_fibre,formatting=tails
