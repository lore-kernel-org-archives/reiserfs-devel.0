From: Oleg Drokin <green@namesys.com>
Subject: Re: what data resides on a given block
Date: Wed, 5 Jun 2002 17:06:57 +0400
Message-ID: <20020605170657.A19597@namesys.com>
References: <5.0.2.1.2.20020605145712.01ba40f0@pop.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10517-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <5.0.2.1.2.20020605145712.01ba40f0@pop.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Newsmail <newsmail@satimex.tvnet.hu>
Cc: reiserfs-list@namesys.com

Hello!

   If you want to look at the contents, you can extract the content into 
   a file with dd and then view it.
   If you want to know if the block represents some FS metadata,
   you can use debugreiserfs -1 blocknumber 
   and it will print the content of metadata block (if it will recognise
   block contents as metadata)

   This only applies to reiserfs, of course.

Bye,
    Oleg
On Wed, Jun 05, 2002 at 02:58:20PM +0100, Newsmail wrote:
> I would like to know, if I know the blocknumber, is there any way to see 
> what data I have on it?
> greg
> 
> 
