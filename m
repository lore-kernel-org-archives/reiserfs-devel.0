From: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 18:19:59 +0300
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <200408261819.59328.vda@port.imtp.ilyichevsk.odessa.ua>
References: <Pine.LNX.4.44.0408261011410.27909-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0408261011410.27909-100000@chimarrao.boston.redhat.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rik van Riel <riel@redhat.com>
Cc: Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thursday 26 August 2004 17:12, Rik van Riel wrote:
> On Thu, 26 Aug 2004, Denis Vlasenko wrote:
> > I think Hans is not planning turning old "file is a stream of bytes"
> > into eight-stream octopus. One stream will remain as a 'main' one,
> > which contains actual data. Others will keep metadata, etc...
>
> This is exactly what the Samba people want, though.
>
> Office suites can store a document with embedded images
> and spread sheets "easily" by putting the text, the
> images and spread sheets all in different file streams.

Kinda far reaching. It's hard to assess whether that is good or bad idea.
Can we start small, like putting metadata (e.g. ACLs) into these streams?
--
vda

