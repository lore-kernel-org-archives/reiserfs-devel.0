From: Metztli Information Technology <jose@metztli-it.com>
Subject: Reiser4 \(detect only\) for GNU Parted v3.3
Date: Tue, 10 Nov 2020 23:39:07 -0800
Message-ID: <20201111073908.40081-1-jose@metztli-it.com>
Reply-To: jose.r.r@metztli.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1605080384; h=Content-Transfer-Encoding: MIME-Version:
 Reply-To: Message-Id: Date: Subject: To: From: Sender;
 bh=mrPwHCzkcZhSA0GtLpH4KYk3BkUKty7a7HHalvTbKHI=; b=Fvu1ZLMSAcuSvjckHSls1PUmDeNEgc42hW3xkQUC1R3i80SS8FY3iEl/utrDFAcVWfjgoicE
 if9TZa+JxhbPexgnL7iX00pSDy34yJq6KV0C22F/kEVXtXfT9ttFIVfgNKRBEqlZMoe3Mgwl
 KBerkfq6avGEijsPyZKmHiGuhoE=
Sender: jose=metztli-it.com@mixtli.metztli.it
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org


As upcoming Debian Bullseye will use Debian packaging for GNU Parted v3.3-x
< https://github.com/Metztli/debian-parted-reiser4 >

I had to re-enable Reiser4 in GNU Parted first (found in the debian/patches/metztli directory in GitHub repo, as well).

Otherwise the non-reiser4 aware official Debian GNU parted 
< https://packages.debian.org/bullseye/parted >
will take precedence during installation and my Metztli Reiser4 netboot installers will fail.

Of course, this patch applies to standalone GNU Parted v3.3
< https://www.gnu.org/software/parted/ >

for those persons not on Linux Debian.


Best Professional Regards

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.8.15 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/

