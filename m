From: doiggl@velocitynet.com.au
Subject: Re: Nightly Builds
Date: Fri, 11 Jul 2008 01:21:38 +1000 (EST)
Message-ID: <24383.202.168.22.19.1215703298.squirrel@webmail.velocity.net.au>
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
    <23129.202.168.22.19.1214638448.squirrel@webmail.velocity.net.au>
    <4866575D.1000305@suse.com>
    <14971.202.168.22.19.1214748124.squirrel@webmail.velocity.net.au>
    <4867DC31.2030702@suse.com>
    <23784.202.168.22.19.1214826598.squirrel@webmail.velocity.net.au>
    <4868F3C8.2090006@suse.com>
    <20253.202.168.22.19.1215615647.squirrel@webmail.velocity.net.au>
    <4874D51A.7020909@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4874D51A.7020909@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org

Hello,
Success. I got the reiser4 module installed.

# rpm -qa | grep -i reiser4
reiser4-kmp-default-0.1_2.6.25.9_1.1-22.2

Source was:
http://download.opensuse.org/repositories/drivers:/filesystems/openSUSE_Factory/x86_64/reiser4-kmp-default-0.1_2.6.25.9_1.1-22.2.x86_64.rpm

# rpm -qa | grep -i kernel
kernel-default-2.6.25.9-0.2
kernel-syms-2.6.25.9-0.2
kernel-source-2.6.25.9-0.2
linux-kernel-headers-2.6.25-8.1
nfs-kernel-server-1.1.2-8.1
kernel-xen-2.6.25.9-0.2

Questions:
- In order to use the reiser4 module, do I need to boot to a different
kernel flavor which is installed, if so which one ?

- How do I verify the reiser4 module is ready for use ?

- I've got a spare disk installed but not formatted yet. How do I format
it with reiser4 ?

- I can run some file system tests I'm happy to do so. Have you got some
tests I can run ? I'm happy to post the results.


Jeff wrote
> Strange. That's not the file I see in that link. I see
> reiser4-kmp-default-0.1_2.6.25.5_1.1-22.1.x86_64.rpm, which should match
> your installation.
>
> - -Jeff


