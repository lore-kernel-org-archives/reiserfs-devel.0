From: <doiggl@velocitynet.com.au>
Subject: Re: help wanted add-node41.patch fails to apply to reiser4progs version 1.0.9
Date: Fri, 20 Feb 2015 14:33:54 +1100
Message-ID: <f644dc2cb97898b4a46e27c0b33c7dbe@mail.velocitynet.com.au>
References: <a6ad8c02cd6dcddc95b2d7e25d42f35c@mail.velocitynet.com.au> <CAM12Q5R3HCPNjL+wnX6wqXfbCM9F1n_cLLD2rGQcGLgM8Soxew@mail.gmail.com> <cb14e1389131b5cb6ed38b89ed0bf005@mail.velocitynet.com.au> <c889d4bb783dfeb04663b277628e126f@mail.velocitynet.com.au> <1424403076.4261.1.camel@home.ted.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1424403076.4261.1.camel@home.ted.local>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Good News - Build succeeded. Report back to list if you find problems with
built rpms.
-- Cheers Glenn

# added 2 lines to spec file  reiser4progs.spec
BuildRequires:  automake
BuildRequires:  libtool

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
