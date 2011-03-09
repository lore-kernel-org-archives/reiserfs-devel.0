From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 Oops on vanilla 2.6.37.2
Date: Wed, 09 Mar 2011 23:02:48 +0100
Message-ID: <4D77F908.6080206@gmail.com>
References: <deafa2accc4aa586b6b57e8d9a0fb086.squirrel@ssl.freestuffjunction.co.uk> <4D72BBD0.70907@gmail.com> <4D72C28A.20705@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040106090102030103040303"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D72C28A.20705@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org, Eddie Chapman <eddie@ehuk.net>

This is a multi-part message in MIME format.
--------------040106090102030103040303
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2011 12:08 AM, reiserfs-devel@vger.kernel.org wrote:
> On 05/03/11 22:40, Edward Shishkin wrote:
>> On 03/05/2011 03:29 PM, Eddie Chapman wrote:
>>> Hello,
>>
>> Hello.
>
> Thanks for the prompt reply :)
>
>>
>>>
>>> Firstly many thanks for the brilliant work being put into reiser4.
>>>
>>> Been using reiser4 for about 10 days or so on two software raid6 devices
>>> containing lots of imap mail directories. One partition has about 55GB
>>> mail in total, the other only about 4GB.
>>>
>>> So far so good with no major problems until this morning, when the Oops
>>> below (scroll down to bottom of mail) happened. The system continued
>>> functioning with no apparent data loss except load average rose to 24
>>> within about 30 secs of the Oops and continued to rise steadily until
>>> system became unresponsive after 3-4 hrs with load average at 1189.
>>>
>>> This is a Centos 5.5 64 bit box with vanilla kernel.org 2.6.37.2 and
>>> reiser4-for-2.6.37.patch
>>>
>>> I have both the raid md devices mounted as reiser4 with
>>> noatime,nodiratime
>>>
>>> I notice this Oops reported here and Edward's patch to address the
>>> problem:
>>> http://www.spinics.net/lists/reiserfs-devel/msg02648.html
>>>
>>> Searching through reiser4-for-2.6.37.patch it seems that patch is in
>>> there, but I still got the Oops.
>>
>> This is another problem.
>
> Aaah yes you're right, I just saw jbd2__journal_start and
> ext4_journal_start_sb in both Oops but didn't look further.
>
>>
>>>
>>> Similarly to the previous case, this box is using ext4 for all the other
>>> filesystems.
>>>
>>> If another patch is not possible in the near future would downgrading
>>> the
>>> other filesystems to ext3 be a temporary workaround for this issue?
>>
>> I have attached a temporal workaround, it should help.
>> Note, that I didn't test this patch: I'll be able to do it
>> at the end of weekends.
>
> Many thanks, I will apply it tonight and report back.
>
> Eddie

Sorry, I've encountered strange deadlocks with this patch.
Please, roll it back and use the attached one as the temporal
workaround.

Thanks,
Edward.




--------------040106090102030103040303
Content-Type: text/plain;
 name="reiser4-use-nofs-gfp-flag.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="reiser4-use-nofs-gfp-flag.patch"

LS0tCiBmcy9yZWlzZXI0L2NvbnRleHQuaCB8ICAgIDMgKysrCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspCgpJbmRleDogbGludXgtMi42LjM3L2ZzL3JlaXNlcjQvY29udGV4
dC5oCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0KLS0tIGxpbnV4LTIuNi4zNy5vcmlnL2ZzL3JlaXNlcjQvY29u
dGV4dC5oCisrKyBsaW51eC0yLjYuMzcvZnMvcmVpc2VyNC9jb250ZXh0LmgKQEAgLTE0Nywx
MCArMTQ3LDEzIEBAIHN0YXRpYyBpbmxpbmUgcmVpc2VyNF9jb250ZXh0ICpnZXRfY3VycmUK
IAogc3RhdGljIGlubGluZSBnZnBfdCByZWlzZXI0X2N0eF9nZnBfbWFza19nZXQodm9pZCkK
IHsKKyNpZiAwCiAJcmVpc2VyNF9jb250ZXh0ICpjdHg7CiAKIAljdHggPSBnZXRfY3VycmVu
dF9jb250ZXh0X2NoZWNrKCk7CiAJcmV0dXJuIChjdHggPT0gTlVMTCkgPyBHRlBfS0VSTkVM
IDogY3R4LT5nZnBfbWFzazsKKyNlbmRpZgorCXJldHVybiBHRlBfTk9GUzsKIH0KIAogdm9p
ZCByZWlzZXI0X2N0eF9nZnBfbWFza19zZXQodm9pZCk7Cg==
--------------040106090102030103040303--
