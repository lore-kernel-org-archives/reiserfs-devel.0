From: <doiggl@velocitynet.com.au>
Subject: Here is a plain kernel based on 3.6.x with the reiser4 patch enabled.
Date: Tue, 23 Oct 2012 13:15:57 +1100
Message-ID: <d90bd505a6589a2abfe36604e623d60f@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello.
Here is a plain kernel based on 3.6.x with the reiser4 enabled, its built
with the Open Build Service (OBS) system.
Report any problems to the list.
Cheers Glenn

The project is here:

->https://build.opensuse.org/package/show?package=kernel-reiser4&project=home%3Adoiggl

The built rpms are here:

->https://build.opensuse.org/package/binaries?package=kernel-reiser4&project=home%3Adoiggl&repository=openSUSE_12.2

The log of the build is here {x86_64} as an example. [Its a long buildlog]
->https://build.opensuse.org/package/rawlog?arch=x86_64&package=kernel-reiser4&project=home%3Adoiggl&repository=openSUSE_12.2

The .spec used file is here:

->https://build.opensuse.org/package/view_file?file=kernel-reiser4.spec&package=kernel-reiser4&project=home%3Adoiggl&srcmd5=c1f7ad8470fed45a842cabedd7589c2c

The patch used was:
http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.x/reiser4-for-3.6.2.patch.gz/download

You may want to update the news section in:
https://reiser4.wiki.kernel.org/index.php/Main_Page

Cheers Glenn...
