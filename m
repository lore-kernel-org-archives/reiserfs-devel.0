From: Morgan Smith <m2@intersafeit.com>
Subject: Re: Reiser4 extremely slow at deleting.
Date: Wed, 27 Jul 2016 12:15:22 -0600
Message-ID: <0aa0ad49-a6a7-4d53-8a91-aa78821156c2@intersafeit.com>
References: <nnasaq$lpq$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=intersafeit.com;
	s=default; t=1469643323;
	bh=99b/GSfJPuJ6Y47CJPGzQ6s6VCpBUGC39GL2ByYvepI=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=IPeUgMJzJ9V9YQGvS4BfDprdBtEtchkqhArbJIhXWOCctVhTO0OEIbAUwh08Lv56F
	 uRJLwvzncjcLRu4nLyUQb6oKzbEyOc67HsYylfwb+X4KJMumg1fU6TGcaDb21+5IRa
	 WBYtxpSVrEeOZyvS88N6srN7ZQWKgzlx7vRXR284=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=intersafeit.com;
	s=default; t=1469643322;
	bh=99b/GSfJPuJ6Y47CJPGzQ6s6VCpBUGC39GL2ByYvepI=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=EmjI/bdSOZEutZQmnXf+1u+eZc57PTEo/NUs03052CA7GUYK812++5XfUz7ojdvbD
	 PWqViNpIOzCYSmej89PHZJ/2U7Cybu5RvoIXpeTrid2S3Q3N8UTAcF+7fMpKFaGdv9
	 XJl3+v50hEvHRLNkC0xZg79qSXNvyaEhPZ0CV+k0=
In-Reply-To: <nnasaq$lpq$1@ger.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Georgios Tsalikis <georgios@tsalikis.net>, reiserfs-devel@vger.kernel.org

Was the file system created using the reg40 plugin or ccreg40 for on the
fly compression?

It seems to me I had this issue when using ccreg40 for on the fly
compression. I wrote a similar request for help some years ago and I
believe the answer was to not use compression. IIRC it's not an issue
with the compression itself rather the handling of allocated space for
it and the shuffling that is done when releasing resources. I was unable
to quickly find my old email to the list to confirm :(

On 07/27/2016 11:51 AM, Georgios Tsalikis wrote:
> It is almost always like this. For example a directory with 2.5GB of
> large files takes about 2 minutes. Right now i am deleting a large
> directory with small files, I didn't keep the numbers before running,
> but they are many directories with source code. Could it be
> fragmentation? And how could I mitigate it? Thanks
> 
> 
> -- 
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
