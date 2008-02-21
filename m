From: "Edward Shishkin" <edward.shishkin@gmail.com>
Subject: Re: Reiser4
Date: Thu, 21 Feb 2008 15:56:19 +0300
Message-ID: <5c7c368b0802210456o77bbe99dy2781e8c0225e95fb@mail.gmail.com>
References: <alpine.LRH.1.00.0802201656050.6228@skynet.shatteredsilicon.net>
	 <47BC6692.4090905@gmail.com>
	 <alpine.LRH.1.00.0802201748170.6726@skynet.shatteredsilicon.net>
	 <47bc6c10.03eb300a.57b7.ffff8e27@mx.google.com>
	 <47BCA1E0.9050408@bobich.net>
	 <47bcc14d.0c53300a.2288.ffffb39c@mx.google.com>
	 <alpine.LRH.1.00.0802210922120.5782@skynet.shatteredsilicon.net>
	 <47BD55CA.6070902@gmail.com>
	 <alpine.LRH.1.00.0802211121570.9972@skynet.shatteredsilicon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=nCPS81LtKTN9wGInVRaXFSf5Wh6eSI5yOstwfFKcnNU=;
        b=Fyo+j8oChDlgJhFHnkEQe1YxdPF7etTOv4ifkerYg6p7CacdUXZSBzpp5UiIZBd+4BRHzSCI/qImLP6Aarui59zTUrnjLYgbdzJ3a7R2emN1+TOcnNPNJHVvw/u4cFqdu647n+f/98T+m217dLl1iHsRqHQmplvNYP3iFADJSP0=
In-Reply-To: <alpine.LRH.1.00.0802211121570.9972@skynet.shatteredsilicon.net>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "gordan@bobich.net" <gordan@bobich.net>
Cc: Maverick <maverick.pt@gmail.com>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

On 2/21/08, gordan@bobich.net <gordan@bobich.net> wrote:

...

>  Is tail packing used by default? I seem to remember that it was not used
>  by default if compression was emabled. Is this the case? Is it possible to
>  use both compression and tail packing?
>

Transparent compression has nothing with tail packing.

Cryptcompress file plugin doesn't operate with tails/extents.
This is a different file plugin, that can be considered as another
file system, which uses the same low-level code (nodes,
balancing, etc).

Tails/extents are a business of (default) unix-file plugin,
whereas cryptcompress file plugin operates only with so-called
"ctail items", which look mostly like tails, but ain't merged at
logical cluster boundaries, plus some other peculiar properties.

If compression is enabled, then in default mode management
will be passed to unix-file plugin with "notail" policy, as soon
as some heuristic detects, that file is incompressible. See
http://66.102.9.104/search?q=cache:TkVTWciE3F8J:www.namesys.com/cryptcompress_design.html
for details.

Edward.


>
>  >> Are there any plans to put it all up on Sourceforge or similar, with public
>  >> CVS access, mailing lists etc, so the user community can get more involved
>  >> in the project?
>  >
>
> > Flex still doesn't have a time to repair namesys.com
>
>
> Ah, so it will be back. Good to know. :-)
>
>  Many thanks for your help.
>
>  Gordan
>
