From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCHv6 3/5] reiser4: discard support: initial implementation
 using linked lists.
Date: Sun, 20 Jul 2014 23:04:49 +0200
Message-ID: <53CC2EF1.8010705@gmail.com>
References: <1403434126-6390-1-git-send-email-intelfx100@gmail.com> <2333335.ugWK4TrHUo@intelfx-laptop> <53C2D82B.7030201@gmail.com> <2160912.yche19jEn0@intelfx-laptop> <53C338DB.7070603@gmail.com> <53CAE12E.7090504@gmail.com> <AC6185ED-DBDD-4BCE-B6B6-631165EE69CD@gmail.com> <53CBB736.40802@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=Waj9VZMLzg4aVunBzQdenu71DnXFbZ/5qjj7ZY2l/HQ=;
        b=MOOsus1TLN3dm0cs7Nfr6Is561tIMtf6zWv74svtYAMjH6xowqN8QiEf6buSeQBsM7
         kF6YcNAlcU3giHKruZj+IXY1RiM1tb06C+DetGOTcLALr5A6BbBm69EbXDAyM2OMdlEx
         lo3aH12raNgml/ygqTbhhNSRYD48RH4++0W9cwe8aGbAt8U6LncJ28XmAFxpo5tRRQyK
         vWHUETF7ZPgiv6unzyXvgazDTI40QtmsDriC4FEc4xMQdHoyZQYtxCfvNEzROKVzkapn
         tbelp10zMaHBcAQWKGGFdKWCx21Nny2fCad2UZjpccJu0zqJHU5vBeoEBCwHwO8/FXzu
         CBRA==
In-Reply-To: <53CBB736.40802@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>


On 07/20/2014 02:33 PM, Edward Shishkin wrote:
>
> On 07/20/2014 12:06 PM, Ivan Shapovalov wrote:
>>> 20 =C9=C0=CC=D1 2014 =C7., =D7 1:20, Edward Shishkin <edward.shishk=
in@gmail.com>=20
>>> =CE=C1=D0=C9=D3=C1=CC(=C1):
>>>
>>>
>>>> On 07/14/2014 03:56 AM, Edward Shishkin wrote:
>>>>
>>>>> On 07/13/2014 09:18 PM, Ivan Shapovalov wrote:
>>> [...]
>>>>> Nothing seems to call at least check_free_blocks(begin, end)...
>>>>
>>>> Oh, bad... I thought all this time that extents of the delete sets=
=20
>>>> are still dirty
>>>> in the working bitmap at the moment of discard.
>>>> Hmm, I definitely don't want to check the whole extents for discar=
d...
>>>
>>> False alarm, actually..
>>>
>>> Nothing is wrong if someone makes them dirty before issuing our dis=
card
>>> requests: his changes will be committed in the next sessions of=20
>>> possessing
>>> the commit_mutex _after_ our discard. Everything is isolated.. For=20
>>> the same
>>> reason we don't care if someone allocate blocks in head and tail=20
>>> paddings
>>> before issuing our padded discard extents.
>> I was just thinking about the very same possible race...
>>
>> But well, isn't the call to current_atom_complete_writes() placed=20
>> before acquisition of commit_mutex? I was under impression of that=20
>> relocate sets could be written while another atom is being committed=
=20
>> under the mutex.
>
> take the commit_mutex before flush if discard_enabled &&=20
> should_check_heads.


Actually, this is not so simple. E.g. I got a deadlock..
Another option is to make head/tail paddings dirty with the
following update of the extent of the delete_set.
One more option is to not support such discard params.

Edward.


>
>>
>> --=20
>> Ivan Shapovalov / intelfx /
>>
>> (Sent from a phone. Havoc may be wreaked on the formatting.)
>>
>>> We only need to make sure that
>>> they were clean at _our_ commit session.
>>>
>>> Anyway, let's use delayed deallocation. I like it better than=20
>>> aux_delete_set.
>>> After all, we can roll everything back at every moment, if any=20
>>> problems..
>>>
>>> Edward.
>

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
