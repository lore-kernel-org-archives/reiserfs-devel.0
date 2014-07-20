From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCHv6 3/5] reiser4: discard support: initial implementation
 using linked lists.
Date: Sun, 20 Jul 2014 14:33:58 +0200
Message-ID: <53CBB736.40802@gmail.com>
References: <1403434126-6390-1-git-send-email-intelfx100@gmail.com> <2333335.ugWK4TrHUo@intelfx-laptop> <53C2D82B.7030201@gmail.com> <2160912.yche19jEn0@intelfx-laptop> <53C338DB.7070603@gmail.com> <53CAE12E.7090504@gmail.com> <AC6185ED-DBDD-4BCE-B6B6-631165EE69CD@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=JLhae7TpU5R564jw/oOv5wADT5zw2ax2XvaXb48aUT8=;
        b=gGNPv6eWo6ouzzfVzxPpvG5SD9R51/gwKgy9cK8D4udg/phgynoo3ZXkJNZ9M1V7rc
         LqcFhEAGwSACFsGNc8UHihBiwute19YTDaaj/8t+OrUrhwwjmXI4q4rL34phyPIEZiYy
         VFT5/TVhW2M/4MlYkBOCXuM7zqlJJ6mt0A+JA6PcxmKOjQDo9AYB37TvN9+yJ1vMNLox
         SEa59ez4P18dbMmartfJRUShTnRLCHEte8jQDCTuKNLCs34rnThc4njpcDxtszaDK5MD
         KnNc/f97QGISGW7H52HpWwlvRum3llAei/w2Vtl0DeObCeA/jMccPEq79ouJA7C0bE6E
         uDQQ==
In-Reply-To: <AC6185ED-DBDD-4BCE-B6B6-631165EE69CD@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>


On 07/20/2014 12:06 PM, Ivan Shapovalov wrote:
>> 20 =C9=C0=CC=D1 2014 =C7., =D7 1:20, Edward Shishkin <edward.shishki=
n@gmail.com> =CE=C1=D0=C9=D3=C1=CC(=C1):
>>
>>
>>> On 07/14/2014 03:56 AM, Edward Shishkin wrote:
>>>
>>>> On 07/13/2014 09:18 PM, Ivan Shapovalov wrote:
>> [...]
>>>> Nothing seems to call at least check_free_blocks(begin, end)...
>>>
>>> Oh, bad... I thought all this time that extents of the delete sets =
are still dirty
>>> in the working bitmap at the moment of discard.
>>> Hmm, I definitely don't want to check the whole extents for discard=
=2E..
>>
>> False alarm, actually..
>>
>> Nothing is wrong if someone makes them dirty before issuing our disc=
ard
>> requests: his changes will be committed in the next sessions of poss=
essing
>> the commit_mutex _after_ our discard. Everything is isolated.. For t=
he same
>> reason we don't care if someone allocate blocks in head and tail pad=
dings
>> before issuing our padded discard extents.
> I was just thinking about the very same possible race...
>
> But well, isn't the call to current_atom_complete_writes() placed bef=
ore acquisition of commit_mutex? I was under impression of that relocat=
e sets could be written while another atom is being committed under the=
 mutex.

take the commit_mutex before flush if discard_enabled && should_check_h=
eads.

>
> --
> Ivan Shapovalov / intelfx /
>
> (Sent from a phone. Havoc may be wreaked on the formatting.)
>
>> We only need to make sure that
>> they were clean at _our_ commit session.
>>
>> Anyway, let's use delayed deallocation. I like it better than aux_de=
lete_set.
>> After all, we can roll everything back at every moment, if any probl=
ems..
>>
>> Edward.

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
