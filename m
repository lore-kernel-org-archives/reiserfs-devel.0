From: Frederik Himpe <fhimpe@vub.ac.be>
Subject: Re: libaal patch fixing pointer cast warnings
Date: Sun, 15 Feb 2009 19:19:59 +0100
Message-ID: <1234721999.14332.5.camel@Anastacia>
References: <1234383815.5099.3.camel@Anastacia.local>
	 <1234385241.5099.5.camel@Anastacia.local>
	 <18839.24405.36274.827765@edward.zelnet.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <18839.24405.36274.827765@edward.zelnet.ru>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

On zo, 2009-02-15 at 03:18 +0300, Edward Shishkin wrote:

> Nop, This is wrong!
> 
> This macro is to cut a chunk header.
> If you cast from pointer to pointer, then it will cut
> unexpected number of bytes:
> (int)x - y is not the same as (int *)x - y. 
> 
> Please, try the following patch.

Thanks, it builds fine with your patch.

-- 
Frederik Himpe

