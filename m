From: Eddie Chapman <eddie@ehuk.net>
Subject: Re: Reiser4 Oops on vanilla 2.6.37.2
Date: Wed, 09 Mar 2011 22:10:37 +0000
Message-ID: <4D77FADD.9040003@ehuk.net>
References: <deafa2accc4aa586b6b57e8d9a0fb086.squirrel@ssl.freestuffjunction.co.uk> <4D72BBD0.70907@gmail.com> <4D72C28A.20705@vger.kernel.org> <4D77F908.6080206@gmail.com>
Reply-To: Eddie Chapman <eddie@ehuk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=freestuffjunction.co.uk; s=default; t=1299708638;
	bh=a5YnTRCeDZMhfwQcJ1P8FVa3dX5AEdw6WoVaTEzQ65M=;
	h=Message-ID:Date:From:Reply-To:MIME-Version:To:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=nnSDi0XTNIeiSXpVEvcm8ju+IE+V1GMpQ4RXN8cOgaPgcHvc+u1BQEO6nZBmBI4VN
	 C8r0uRuozNXfFicEjpVZEpdv8LkksgSg9Fp9KvtQZGBBdk+XLefCBv7DHS4mCynFmZ
	 BSGr76KLFVh009UhzqEQWTv117zKd4RvpoUsFzEQ=
In-Reply-To: <4D77F908.6080206@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

On 09/03/11 22:02, Edward Shishkin wrote:
> On 03/06/2011 12:08 AM, reiserfs-devel@vger.kernel.org wrote:
>> On 05/03/11 22:40, Edward Shishkin wrote:
>>> On 03/05/2011 03:29 PM, Eddie Chapman wrote:
>>>> Hello,
>>>
>>> Hello.
>>
>> Thanks for the prompt reply :)
>>
>>>
>>>>
>>>> Firstly many thanks for the brilliant work being put into reiser4.
>>>>
>>>> Been using reiser4 for about 10 days or so on two software raid6
>>>> devices
>>>> containing lots of imap mail directories. One partition has about 55GB
>>>> mail in total, the other only about 4GB.
>>>>
>>>> So far so good with no major problems until this morning, when the Oops
>>>> below (scroll down to bottom of mail) happened. The system continued
>>>> functioning with no apparent data loss except load average rose to 24
>>>> within about 30 secs of the Oops and continued to rise steadily until
>>>> system became unresponsive after 3-4 hrs with load average at 1189.
>>>>
>>>> This is a Centos 5.5 64 bit box with vanilla kernel.org 2.6.37.2 and
>>>> reiser4-for-2.6.37.patch
>>>>
>>>> I have both the raid md devices mounted as reiser4 with
>>>> noatime,nodiratime
>>>>
>>>> I notice this Oops reported here and Edward's patch to address the
>>>> problem:
>>>> http://www.spinics.net/lists/reiserfs-devel/msg02648.html
>>>>
>>>> Searching through reiser4-for-2.6.37.patch it seems that patch is in
>>>> there, but I still got the Oops.
>>>
>>> This is another problem.
>>
>> Aaah yes you're right, I just saw jbd2__journal_start and
>> ext4_journal_start_sb in both Oops but didn't look further.
>>
>>>
>>>>
>>>> Similarly to the previous case, this box is using ext4 for all the
>>>> other
>>>> filesystems.
>>>>
>>>> If another patch is not possible in the near future would downgrading
>>>> the
>>>> other filesystems to ext3 be a temporary workaround for this issue?
>>>
>>> I have attached a temporal workaround, it should help.
>>> Note, that I didn't test this patch: I'll be able to do it
>>> at the end of weekends.
>>
>> Many thanks, I will apply it tonight and report back.
>>
>> Eddie
>
> Sorry, I've encountered strange deadlocks with this patch.
> Please, roll it back and use the attached one as the temporal
> workaround.
>
> Thanks,
> Edward.

Hi Edward,

OK, thanks.  I applied the first one at the weekend and the box hasn't 
had any problems it is still up.  I'll apply this one tonight and email 
an update after it has been in use for a while.

I'll update to vanilla 2.6.27.3 at the same time, hope that's OK, if you 
think that's a bad idea let me know.

Thanks,
Eddie
