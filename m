From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: RE: [benchmark] seek optimization
Date: Wed, 14 Jul 2004 19:42:59 +0200 (MEST)
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0407141939400.5378-100000@mlf.linux.rulez.org>
References: <OFD5BA136D.E0EDCDF2-ON85256ED1.005BD676-88256ED1.005C2660@us.ibm.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <OFD5BA136D.E0EDCDF2-ON85256ED1.005BD676-88256ED1.005C2660@us.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bryan Henderson <hbryan@us.ibm.com>
Cc: Guy <bugzilla@watkins-home.com>, linux-fsdevel@vger.kernel.org, 'Marcel Hilzinger' <mhilzinger@linuxnewmedia.de>, 'Per Olofsson' <pelle@dsv.su.se>, reiserfs-list@namesys.com


On Wed, 14 Jul 2004, Bryan Henderson wrote:

> It would also be nice to have no destination disk at all, to isolate the 
> effects of seek optimization in the source filesystem.

The mentioned theoretical best values had seeks neither in the source nor
in the destination. Sorry I forgot to explain.

	Szaka

