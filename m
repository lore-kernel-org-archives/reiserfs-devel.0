From: Oleg Drokin <green@namesys.com>
Subject: Re: what data resides on a given block
Date: Wed, 5 Jun 2002 18:18:01 +0400
Message-ID: <20020605181801.A25034@namesys.com>
References: <5.0.2.1.2.20020605145712.01ba40f0@pop.tvnet.hu> <5.0.2.1.2.20020605145712.01ba40f0@pop.tvnet.hu> <5.0.2.1.2.20020605155413.01ba34b8@pop.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10523-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <5.0.2.1.2.20020605155413.01ba34b8@pop.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Newsmail <newsmail@satimex.tvnet.hu>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Jun 05, 2002 at 04:04:35PM +0100, Newsmail wrote:

> actually the exemple tells me to make a new reiserfs filesystem, then make 
> whatever file I want, and 'assign those bad blocks to that file'. Actually 
> I dont have the possibility to reformat my drive, and I have some files 
> residings on the bad blocks. I would like to know what will happen if I use 
> the add-bad-block program on my filesystem where those bad blocks are 
> occupied by an already existing file. actually I'M aware of some files that 
> are on those bad blocks, but I'm sure there are others that I dont know 
> about. so if I use the add-bad-block program, will this work just fine, and 
> will the bad blocks be deactived 'forever' or it will just wont work at 
> all, for exemple when I try to delete afterwards a file that contained 
> those blocks before. sorry if I have a bad english,

No, it does not work if you have a file over the badblocks.
So you need to delete files taht contains badblocks before using add-bad-block
program.

BTW, there is some work is going on to have more mature badblocks supports for
reiserfs.

Bye,
    Oleg
