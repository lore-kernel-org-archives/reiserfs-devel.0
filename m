From: Chris Mason <chris.mason@oracle.com>
Subject: Re: migratepage failures on reiserfs
Date: Wed, 31 Oct 2007 13:40:06 -0400
Message-ID: <20071031134006.2ecd520b@think.oraclecorp.com>
References: <1193768824.8904.11.camel@dyn9047017100.beaverton.ibm.com>
	<20071030135442.5d33c61c@think.oraclecorp.com>
	<1193781245.8904.28.camel@dyn9047017100.beaverton.ibm.com>
	<20071030185840.48f5a10b@think.oraclecorp.com>
	<1193847261.17412.13.camel@dyn9047017100.beaverton.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <1193847261.17412.13.camel@dyn9047017100.beaverton.ibm.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Badari Pulavarty <pbadari@us.ibm.com>
Cc: reiserfs-devel@vger.kernel.org, linux-mm <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

On Wed, 31 Oct 2007 08:14:21 -0800
Badari Pulavarty <pbadari@us.ibm.com> wrote:
> 
> I tried data=writeback mode and it didn't help :(

Ouch, so much for the easy way out.

> 
> unable to release the page 262070
> bh c0000000211b9408 flags 110029 count 1 private 0
> unable to release the page 262098
> bh c000000020ec9198 flags 110029 count 1 private 0
> memory offlining 3f000 to 40000 failed
> 

The only other special thing reiserfs does with the page cache is file
tails.  I don't suppose all of these pages are index zero in files
smaller than 4k?

-chris
