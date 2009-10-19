From: Viji V Nair <viji@fedoraproject.org>
Subject: Re: reiserfs - recommendations for small files
Date: Tue, 20 Oct 2009 00:56:49 +0530
Message-ID: <84c89ac10910191226g7090dcd2m7b7550e5e2bcdcdb@mail.gmail.com>
References: <84c89ac10910171111n69b9832fr42d30aa07d84b262@mail.gmail.com>
	 <132F41FF-CA71-4004-9081-5246887ED708@telegraphics.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=Jp7svQCkoNjFZG7YLkGseBQNNJXQs1v6pDUSSeNgaTM=;
        b=lYru7xIhDtayAldCQwuMQep6P1k2OJk9ElMLoJA5OCI16Hhisy/MiYZn8wLKqapKVy
         gKyRwUaRAnaYPdvRU6PV0S297QA52ORNDuA9htoLkFAY6Df5dxdbGMaivvAEW7I0MdCg
         N3GIc+p2p+qzPpXpjdNEiLB+qDVYjI/fY8D90=
In-Reply-To: <132F41FF-CA71-4004-9081-5246887ED708@telegraphics.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Toby Thain <toby@telegraphics.com.au>
Cc: reiserfs-devel@vger.kernel.org

I

On Tue, Oct 20, 2009 at 12:46 AM, Toby Thain <toby@telegraphics.com.au>=
 wrote
>
> On 17-Oct-09, at 2:11 PM, Viji V Nair wrote:
>
>> Hi,
>>
>> System : Fedora 11 x86_64
>> Current Filesystem: 150G ext4 (formatted with "-T small" option)
>> Number of files: 50 Million, 1 to 30K png images
>>
>> We are generating these files using a python programme and getting
>> very slow IO performance. While generation there are only writes, no
>> read. After generation there are heavy read and no write. These file=
s
>> are not in a single directory, this is a pyramid structure. There ar=
e
>> total 15 pyramids and coming down from top to bottom the sub
>> directories and files =A0are multiplied by a factor of 4
>>
>> I am looking for an alternate file system and best
>> practices/recommendation to get a better performance. What the
>> optimisation methods available in reiserfs for small files?
>
> You could benchmark this on reiser3 today (it's perfectly stable & sm=
all
> file handling is supposedly a sweet spot).

I am creating a fedora 11 kernel rpm with reiserfs3 and reiser4
support, planning to bench mark it on multiple hardware. Will update
the results.

>
> --Toby
>
>>
>> Any suggestions of the above are greatly appreciated.
>>
>> Viji
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-d=
evel"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
