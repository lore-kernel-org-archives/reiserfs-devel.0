From: Dirk Mueller <dmuell@gmx.net>
Subject: Re: 2.4.19-pre7 / corruption on unwanted reboot
Date: Mon, 6 May 2002 20:37:03 +0200
Message-ID: <20020506183703.GA29001@matrix.wg>
References: <20020504211147.GA20092@matrix.wg> <1020564448.3946.609.camel@tiny> <20020506123638.GA15023@matrix.wg> <1020689642.1511.2100.camel@tiny> <20020506135941.GA16598@matrix.wg> <1020695160.3946.2155.camel@tiny>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10264-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1020695160.3946.2155.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Mon, 06 Mai 2002, Chris Mason wrote:

> Any suggestions on how I might reproduce locally?

not much. maybe try a lot of open, unlinked files when pressing reset and 
then check the md5sum's of all files..


Dirk
