From: <doiggl@velocitynet.com.au>
Subject: question about reiser4 partition sizes
Date: Thu, 08 Sep 2011 08:03:52 +1000
Message-ID: <4359415dab39cb7fea28a9409bb70f69@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: reiserfs-devel@vger.kernel.org

Hello,
I have a question about reiser4 partition sizes.
If you used this drive [1], what reiser4 partition sizes would you use
that would be ok to use.
Would you use:

a. 4 * 1 TB partitions
b. 2 * 2 TB partitions
c. 1 * 4 TB partitions

Disks storage seems to be increase, while price over time seems to drop=
=2E
If you used that capacity up , the file system would need to be robust =
and
scalable.
A long time ago I thought 100 mb was a large amount but now that seems=20
tiny.
Cheers Glenn

[1]http://www.seagate.com/www/en-us/products/external/external-hard-dri=
ve/desktop-hard-drive/?intcmp=3Dbac-en-us-home-hero1-goflex-desk-4tb

GoFlex=E2=84=A2 Desk Kit 4TB
STAC4000100
Specifications =09
Model Number 	STAC4000100
Interface 	USB 3.0
Capacity 	4TB
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
