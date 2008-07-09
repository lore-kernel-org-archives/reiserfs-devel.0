From: doiggl@velocitynet.com.au
Subject: Re: Nightly Builds
Date: Thu, 10 Jul 2008 01:00:47 +1000 (EST)
Message-ID: <20253.202.168.22.19.1215615647.squirrel@webmail.velocity.net.au>
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
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4868F3C8.2090006@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org

Hello,
I get the following error message when I try to install
reiser4-kmp-default via smart.
"Can't install reiser4-kmp-default-0.1_2.6.25.7_1.5-23.1@x86_64: no
package provides kernel(default:vmlinux) = 3db9af7df68368aa"

I got the file from
http://download.opensuse.org/repositories/drivers:/filesystems/openSUSE_11.0/x86_64/

What is already installed:
# rpm -qa | grep -i kernel
kernel-syms-2.6.25.5-1.1
nfs-kernel-server-1.1.2-9
kernel-default-2.6.25.5-1.1
kernel-xen-2.6.25.5-1.1
kernel-source-2.6.25.5-1.1
linux-kernel-headers-2.6.25-8.1

Question:
What else do I need to install/change so I can install the reiser4 module ?.
Thanks Glenn

Jeff wrote
> That's not what you want. That's an artifact of the KMP process. You
> want reiser4-kmp-<flavor>
- -Jeff



