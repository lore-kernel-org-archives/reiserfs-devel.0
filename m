From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: max files
Date: Tue, 04 May 2004 13:03:25 +0400
Message-ID: <1083661405.14090.117.camel@tribesman.namesys.com>
References: <3DF9165145FACB4C96977FF650C1E9040C469F16@its-mail1.its.corp.gwl.com>
	 <4096851F.9040508@namesys.com>  <409685C3.30502@mweb.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18423-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <409685C3.30502@mweb.co.za>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: camis <camis@mweb.co.za>
Cc: reiserfs-list@namesys.com

Hello

On Mon, 2004-05-03 at 21:47, camis wrote:
> Hi All,
> 
> Anyone tested to see how fast/sluggish reiser3 (or 4?)
> performs when accessing a directory that has between
> 5 and 25 million flat/text files?
> 

reiser3 performance at this kind of load depends very much on how do you
create files.
Given you use defaut hash to sort names in directory
for i in `seq 1 25000000000`
do
	touch $i
done
should give you "ls -l"-able fileset

reiser4 is not that sensitive to file names and order of creations.
Although, one can speedup of creation substantially if he creates files
in lexicographic order

> Any past experiences? (dont say use subdirectories ;)
> 
> Cami
> 

