From: doiggl@velocitynet.com.au
Subject: Re: Nightly Builds
Date: Sat, 28 Jun 2008 17:34:08 +1000 (EST)
Message-ID: <23129.202.168.22.19.1214638448.squirrel@webmail.velocity.net.au>
References: <66CE03FC-0D5A-4837-A2F5-1D00833EE70E@jasonandannette.us>
    <485C0BA9.5090902@suse.com>
    <28097.202.168.22.19.1214146293.squirrel@webmail.velocity.net.au>
    <485E788A.8020802@suse.com>
    <15568.202.168.22.19.1214194598.squirrel@webmail.velocity.net.au>
    <485FAF96.40608@suse.com>
    <27533.202.168.22.19.1214318654.squirrel@webmail.velocity.net.au>
    <48610B80.3020908@suse.com>
    <15208.202.168.22.19.1214398774.squirrel@webmail.velocity.net.au>
    <48626E1B.6070604@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <48626E1B.6070604@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
I'm trying to install reiser4-0.1-20.2@x86_64 (sourced from
http://download.opensuse.org/repositories/home:/jeff_mahoney/openSUSE_Factory/x86_64/)
with smart package manager, BUT reiser4-0.1-20.2@x86_64 is missing access
to a package.

The Error Message (from smart package manager) is:
Can't install reiser4-0.1-20.2@x86_64: no package provides
kernel(xen:lib_lzo) = 65ae9dc25d9919ce

Question:
Where is the repository so I can install a package which provides
kernel(xen:lib_lzo) = 65ae9dc25d9919ce ?
Glenn

Jeff wrote:
> That RPM, no, since I didn't add the 11.0 repository to the project
> until just now. The build is scheduled, though.
>
> Once that completes, you can use that RPM to do exactly what you
> describe. It will be installed and loaded as if it were part of the
> regular kernel package. You don't even need to reboot, just load the
> module and go.
>
> - -Jeff

