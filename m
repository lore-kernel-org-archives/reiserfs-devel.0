From: lujiongjia <lujiongjia@iscas.ac.cn>
Subject: reiserfsprogs: fail to build from sources on riscv64gc machine
Date: Thu, 2 Feb 2023 17:27:09 +0800
Message-ID: <3e450ff5-f084-4a33-bff7-4ef1061d1f30@iscas.ac.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

The config.guess file contained in source tarball is too old that it 
cannot guess build type on riscv64. Please release new source code 
tarball with the latest autotools.

Full configure error output:

> checking build system type... ./config.guess: unable to guess system type
> 
> This script, last modified 2014-11-04, has failed to recognize
> the operating system you are using. It is advised that you
> download the most up to date version of the config scripts from
> 
>   http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD
> and
>   http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD
> 
> If the version you run (./config.guess) is already up to date, please
> send the following data and any information you think might be
> pertinent to <config-patches@gnu.org> in order to provide the needed
> information to handle your system.
> 
> config.guess timestamp = 2014-11-04
> 
> uname -m = riscv64
> uname -r = 6.1.7-arch1-1
> uname -s = Linux
> uname -v = #1 SMP PREEMPT_DYNAMIC Wed, 18 Jan 2023 19:54:38 +0000
> 
> /usr/bin/uname -p = unknown
> /bin/uname -X     = 
> 
> hostinfo               = 
> /bin/universe          = 
> /usr/bin/arch -k       = 
> /bin/arch              = 
> /usr/bin/oslevel       = 
> /usr/convex/getsysinfo = 
> 
> UNAME_MACHINE = riscv64
> UNAME_RELEASE = 6.1.7-arch1-1
> UNAME_SYSTEM  = Linux
> UNAME_VERSION = #1 SMP PREEMPT_DYNAMIC Wed, 18 Jan 2023 19:54:38 +0000
> configure: error: cannot guess build type; you must specify one

