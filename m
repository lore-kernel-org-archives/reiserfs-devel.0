From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Reiser4progrs Compilation
Date: Thu, 03 Mar 2005 17:07:11 +0300
Message-ID: <1109858829.14024.508.camel@tribesman.namesys.com>
References: <29c041fd345080bf7dd7c0daf8b3389a@stanford.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <29c041fd345080bf7dd7c0daf8b3389a@stanford.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Can Sar <csar@stanford.edu>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2005-03-03 at 16:36, Can Sar wrote:
> Hi,
> 
> The "Getting started with Reiser4" page mentions that any reports about 
> errors while installing Reiser4 should be sent to this list. I have 
> successfully installed the correct kernel and libaal but run into 
> problems with reiser4progs. I issue the following commands, which work 
> fine until make.
> 
> tar zxf reiser4progs-1.0.4.tar.gz
> cd  reiser4progs-1.0.4
> ./configure
> make
> 
> Make complains that there is no Makefile. This is indeed true, the only 
> Makefiles that were created by .configure are Makefile.in and 
> Makefile.am. I tried cp-ing both of these to Makefile, but neither of 
> them worked (as I had expected). I am running Ubuntu. I would be 
> extremely grateful for any help you can provide. I've been fighting 
> with this for hours but just can't get it to work.
> 
did you install libaal-1.0.4?
please send reiser4progs's configure output

> Thank you very much for your help,
> Can Sar
> 
> 

