From: doiggl@velocitynet.com.au
Subject: Re: Nightly Builds
Date: Mon, 30 Jun 2008 00:02:04 +1000 (EST)
Message-ID: <14971.202.168.22.19.1214748124.squirrel@webmail.velocity.net.au>
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
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4866575D.1000305@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
I am using the openSUSE 11 kernel at the moment and it loads the default
kernel (kernel-default-2.6.25.5-1.1).

# uname -a
Linux dhcppc0 2.6.25.5-1.1-default #1 SMP 2008-06-07 01:55:22 +0200 x86_64
x86_64 x86_64 GNU/Linux

Kernel items installed:
# rpm -qa | grep -i kernel
kernel-syms-2.6.25.5-1.1
nfs-kernel-server-1.1.2-9
kernel-default-2.6.25.5-1.1
kernel-xen-2.6.25.5-1.1
kernel-source-2.6.25.5-1.1
linux-kernel-headers-2.6.25-8.1

Questions:
- I can install another kernel if I need to, but I just need to know what
kernel to install and where it is located ?(url please) so I can install
reiser4-0.1-20.2@x86_64 ?

Glenn

> Jeff wrote:
> Are you running the Factory kernel or openSUSE 11? This is a sanity
> check to ensure that symbols that modules need are met by the kernel.
> It's to avoid breakage when you update the kernel and don't have
> compatible modules.

> doiggl@velocitynet.com.au wrote:
>> Hello,
>> I'm trying to install reiser4-0.1-20.2@x86_64 (sourced from
>> http://download.opensuse.org/repositories/home:/jeff_mahoney/openSUSE_Factory/x86_64/)
>> with smart package manager, BUT reiser4-0.1-20.2@x86_64 is missing
>> access
>> to a package.
>>
>> The Error Message (from smart package manager) is:
>> Can't install reiser4-0.1-20.2@x86_64: no package provides
>> kernel(xen:lib_lzo) = 65ae9dc25d9919ce
>>
>> Question:
>> Where is the repository so I can install a package which provides
>> kernel(xen:lib_lzo) = 65ae9dc25d9919ce ?


