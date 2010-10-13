From: <doiggl@velocitynet.com.au>
Subject: Here is a reiser4 build based rpm on 2.6.35 kernel.
Date: Thu, 14 Oct 2010 02:38:37 +1100
Message-ID: <c600cd2a89f1d777774ffbd8180f50f2@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello.
Here is a plain kernel based on 2.6.35 with the reiser4 patch built with
the Opensuse build service [obs] system.

This is my first try at building a patched kernel with reiser4 patch.
Its been a interesting learning experience.

The project is here
 ->
https://build.opensuse.org/package/show?package=kernel-reiser4&project=home%3Adoiggl

The built rpms are here
 ->
https://build.opensuse.org/package/binaries?package=kernel-reiser4&project=home%3Adoiggl&repository=openSUSE_11.3

The log of the build is here {x86_64} as an example. [Its a long build log
]
->
https://build.opensuse.org/package/rawlog?arch=x86_64&package=kernel-reiser4&project=home%3Adoiggl&repository=openSUSE_11.3

The .spec used file is here
 ->
https://build.opensuse.org/package/view_file?file=kernel-reiser4.spec&package=kernel-reiser4&project=home%3Adoiggl&srcmd5=a94730f4e77f3822eb936de1a6138981

Thanks to the opensuse-kernel list members for compilation advice.
http://lists.opensuse.org/opensuse-kernel/

It looks like obs built the rpms.
So, could someone test the rpm's and verify reiser4 options are available
please.
Post the results to the list.

Ta Glenn
