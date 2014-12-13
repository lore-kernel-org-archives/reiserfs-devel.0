From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [Testing Error] xfstests generic/127 - fsx tests modified from
 CXFSQA tests
Date: Sun, 14 Dec 2014 00:55:48 +0100
Message-ID: <548CD204.5010503@gmail.com>
References: <CADW=+3mEeDGx7xFkTvPHijGz6KTkTZHBd42txhAkZKhBsgnS1A@mail.gmail.com> <CADW=+3=nhdXTWC4=yKSpiQjNyDtZ=VN5aa=mS4jXD1idbB1iHA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=uF6JjokRx7Nr+WY+H63vrpFwVDPs2iTq9QX3rIQWQjs=;
        b=JXLMUT1hmjc9I6tAX5PSbymRUtr7TXt7byZsgytoMMWlVg8XGq279Jtoi5FT0uOPC7
         0BhRXb3t56kyhusKEHfGADqJvrXeoLVOB1eUpgqRaJikxrh0pkRhvOxz2MDbrQJ5Hcyn
         QaAvnRnjsBvKgPd3/obgV4E8xBpYogbOwn6p3gH+FiLTKsYS88bRFICufnHdaEWNCh4h
         bb8wJhwNgcyOiSEx4+ZkXRd9GaCq+XKIe0mw/2YXrhxsdS6fY3MlHBH8DVw8pOml5Jhe
         YAm+LJimBA71dYZXhgRuBJXVj+QCPUtt0uVpUkAS9ogmhWAx+bmKGdfTe7cTiWjlMltO
         Ij6A==
In-Reply-To: <CADW=+3=nhdXTWC4=yKSpiQjNyDtZ=VN5aa=mS4jXD1idbB1iHA@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>


On 12/12/2014 07:20 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> On Fri, Dec 5, 2014 at 2:30 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gm=
ail.com> wrote:
>>   fsx tests modified from CXFSQA tests:
>>     - fsx_00_lite
>>    - fsx_05_lite_mmap
>>    - fsx_10_std,
>>     - fsx_15_std_mmap
>>
>> Code: http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.gi=
t;a=3Dblob;f=3Dtests/generic/127;
>> Patch: reiser4-for-3.16.2.patch
>> Extra mount options: none
>>
>> Process is stuck in D state
>> reiser4 xfstests # ps -aux|grep fsx
>> root     12884  1.9  0.3   2868  1876 pts/0    D+   15:14   0:34
>> ltp/fsx -q -l 262144 -o 65536 -S 191110531 -N 100000 -L
>> /mnt/test/fsx_lite_mmap
>>
> It's not stuck in D state but it takes 2hrs to finish which is too lo=
ng.


Track the disk activity by vmstat 2 running on a console


>
>
>>
>> On Fri, Dec 5, 2014 at 2:22 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@g=
mail.com> wrote:
>>> I managed to get xfstests  (
>>> http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=3D=
tree ) to
>>> run on Reiser4 partition. Test for async, acl, quota still don't wo=
rk but a
>>> lot of the rest finishes successfully.
>>> Tests were run on reiser4-for-3.16.2.patch
>>> I'll post unsuccessful tests and their results in following e-mails=
=2E
>>>
>>> Dushan

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
