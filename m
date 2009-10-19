From: Toby Thain <toby@telegraphics.com.au>
Subject: Re: reiserfs - recommendations for small files
Date: Mon, 19 Oct 2009 15:16:36 -0400
Message-ID: <132F41FF-CA71-4004-9081-5246887ED708@telegraphics.com.au>
References: <84c89ac10910171111n69b9832fr42d30aa07d84b262@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <84c89ac10910171111n69b9832fr42d30aa07d84b262@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Viji V Nair <viji@fedoraproject.org>
Cc: reiserfs-devel@vger.kernel.org


On 17-Oct-09, at 2:11 PM, Viji V Nair wrote:

> Hi,
>
> System : Fedora 11 x86_64
> Current Filesystem: 150G ext4 (formatted with "-T small" option)
> Number of files: 50 Million, 1 to 30K png images
>
> We are generating these files using a python programme and getting
> very slow IO performance. While generation there are only writes, no
> read. After generation there are heavy read and no write. These files
> are not in a single directory, this is a pyramid structure. There are
> total 15 pyramids and coming down from top to bottom the sub
> directories and files  are multiplied by a factor of 4
>
> I am looking for an alternate file system and best
> practices/recommendation to get a better performance. What the
> optimisation methods available in reiserfs for small files?

You could benchmark this on reiser3 today (it's perfectly stable &  
small file handling is supposedly a sweet spot).

--Toby

>
> Any suggestions of the above are greatly appreciated.
>
> Viji
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs- 
> devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

