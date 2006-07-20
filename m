From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: other system with datacorruption  (2.425 + datalogging patches)
Date: Thu, 20 Jul 2006 17:38:10 +0400
Message-ID: <1153402690.6436.63.camel@tribesman.namesys.com>
References: <200607201452.09270.fjcabello@visual-tools.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29087-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607201452.09270.fjcabello@visual-tools.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Francisco Javier Cabello <fjcabello@visual-tools.com>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2006-07-20 at 14:52 +0200, Francisco Javier Cabello wrote:
> Hello,
> I have other system with data corruption.

were there unclean shutdowns?
how do you decide when to reiserfsck?
can you please set
hdparm -W 0 
for systems which corrupts often and check if that will change anything?

> I send you the output of 'reiserfsck --check' 
> 
not good.

Is there a chance to try whether data gets corrupted on 2.6.17? Can you
also try to reproduce corruption on kernel not patched with datalogging
patches?
I ask because I guess that you are encountering problems which do not
present in newer kernels.

please describe the load in more details:
how many processes do write to a filesystem at the same time? is that
filesystem the only reiserfs one in the system dedicated especially for
video recording? What is directory structures? How long does it take to
get filesystem corrupted? etc. The more details the better


