From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for 3.16.2 problem: mount: mount /dev/md125 on /mnt/backup
 failed: Cannot allocate memory
Date: Wed, 17 Dec 2014 14:44:06 +0100
Message-ID: <549188A6.2070300@gmail.com>
References: <CADW=+3nWaMdFCpoKQSErTQPu7YHm=4UJEZfZFnn8wOKX9tKrKg@mail.gmail.com> <CADW=+3k7mvPTc0x02UKYbg6Jq=zUQ5dORiUULNiB7kFLXjiG6g@mail.gmail.com> <545965C7.5010304@gmail.com> <CADW=+3k40KVKf5hLD1BgJ8a6uj=ZJ=T_gOmijDZVxWS3pK_6AQ@mail.gmail.com> <54665EFD.7030304@gmail.com> <CADW=+3mrqv=BjX8TCpRszFbr3OYEvgOk0OpcYe56f6OJmYDZbQ@mail.gmail.com> <CADW=+3m75JHiu2fWHJ5mq0Q4XUd2vkp5An1mKsOPkd8OWQnz+w@mail.gmail.com> <547BACC8.6090805@gmail.com> <CADW=+3=Tqw-2yfe6q4ERKSdyu9BmbApoREi-p4A7Auu_k27A6Q@mail.gmail.com> <547BAF3D.1000605@gmail.com> <CADW=+3=GpYCc3aQOexJY7afL6suKxXRhs=dkf0m9zZfHQ0cnFA@mail.gmail.com> <CADW=+3kpg6zYxNWwX5tN0AWZ8Cuof0ccVRsQaL-6knM5AmOhbg@mail.gmail.com> <54843175.7010503@gmail.com> <CADW=+3mU8A6VzsZ2KTmgc=qVhSJ1DHHLmQAcqrk+BvOTKSLnuQ@mail.gmail.com> <54858A06.1000504@gmai
 l.com> <CADW=+3=ogWit1ppvthPSvR9p8RQGjn2OKj7a2QAK-vcppfuhLg@mail.gmail.com> <5485FB84.5010001@gmail.com> <CADW=+3kAMh3hiz7nr6qvW05w21uc=G0RYn-Mu0iT0BGE+QSRJw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=mOG56vsdg7BS2ig81emz8ztjv6hklhPJddZyPhTRGEA=;
        b=Pjq3N2uTOChICY6RyggZfCYAM6Qx2TMIkvze+ZHu42RTaFkQpOU5kAWTBMariiEqf4
         NIPa3pmLLKvQV4VoTb1WfSNLe8kdrEkQZZPECwLSq6+CuA8QdrHThUig6eZz+SvfF4xv
         Qwektsz3iF5fLtqHMAMJmAQ2rWb3T/NpltHOKy9eBVoOAnfSsxLQ7e4cc5INUuS9WqXu
         6URGPLP9Q8xsU8Dcm+t3QQ1lxwf62NWJ0MFMUSxBnaaLKgT/k5sEi7vgjH2drkj/mdXB
         PnI1ZEJO6zyF3A+vGYv37UvKm06v+h2Bsd7JZ17am1Z7aJTjgEry69TBvu62FMAEgArM
         2x5Q==
In-Reply-To: <CADW=+3kAMh3hiz7nr6qvW05w21uc=G0RYn-Mu0iT0BGE+QSRJw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>, Ivan Shapovalov <intelfx100@gmail.com>

On 12/16/2014 02:03 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> On Mon, Dec 8, 2014 at 8:27 PM, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>> So in 3.16 when we ask for some memory, we get ENOMEM
>> plus a corrupted root partition..
>> I would also check the stuff for 3.17 before doing anything.
>>
> With 3.16.2.patch the problem usually manifested after 4th run.
> With 3.17.2.patch last night system finished 5th rsnapshot run withou=
t problems.
> I'll try to keep it up as long as possible.

=2Econfig is from 3.16.2?
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
