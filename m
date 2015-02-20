From: <doiggl@velocitynet.com.au>
Subject: rpms built for reiser4progs with node41 enabled.
Date: Fri, 20 Feb 2015 15:17:39 +1100
Message-ID: <db098c5c256064c2b4cfcd9c67efea66@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Good News - Built rpms for reiser4progs with node41 enabled.
Report back to list if you find problems with them.
-- Cheers Glenn

-Built rpms 
https://build.opensuse.org/package/binaries/home:doiggl/reiser4progs?repository=openSUSE_13.1

Architecture: i586

    libreiser4-1_0-9-1.0.9-56.1.i586.rpm
    libreiser4-1_0-9-debuginfo-1.0.9-56.1.i586.rpm
    libreiser4-minimal-1_0-9-1.0.9-56.1.i586.rpm
    libreiser4-minimal-1_0-9-debuginfo-1.0.9-56.1.i586.rpm
    librepair-1_0-9-1.0.9-56.1.i586.rpm
    librepair-1_0-9-debuginfo-1.0.9-56.1.i586.rpm
    reiser4progs-1.0.9-56.1.i586.rpm
    reiser4progs-1.0.9-56.1.src.rpm
    reiser4progs-debuginfo-1.0.9-56.1.i586.rpm
    reiser4progs-debugsource-1.0.9-56.1.i586.rpm
    reiser4progs-devel-1.0.9-56.1.i586.rpm

Repository has been published Architecture: x86_64

    libreiser4-1_0-9-1.0.9-56.1.x86_64.rpm
    libreiser4-1_0-9-debuginfo-1.0.9-56.1.x86_64.rpm
    libreiser4-minimal-1_0-9-1.0.9-56.1.x86_64.rpm
    libreiser4-minimal-1_0-9-debuginfo-1.0.9-56.1.x86_64.rpm
    librepair-1_0-9-1.0.9-56.1.x86_64.rpm
    librepair-1_0-9-debuginfo-1.0.9-56.1.x86_64.rpm
    reiser4progs-1.0.9-56.1.src.rpm
    reiser4progs-1.0.9-56.1.x86_64.rpm
    reiser4progs-debuginfo-1.0.9-56.1.x86_64.rpm
    reiser4progs-debugsource-1.0.9-56.1.x86_64.rpm
    reiser4progs-devel-1.0.9-56.1.x86_64.rpm

Full Build Log:
https://build.opensuse.org/build/home:doiggl/openSUSE_13.2/x86_64/reiser4progs/_log

Package:
https://build.opensuse.org/package/show/home:doiggl/reiser4progs


# added 2 lines to spec file  reiser4progs.spec
BuildRequires:  automake
BuildRequires:  libtool

