From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 bug?  Zeros in files.
Date: Wed, 03 Mar 2004 10:51:18 +0300
Message-ID: <40458E76.4040808@namesys.com>
References: <1078266036.12548.6.camel@localhost.localdomain>	 <20040303053548.GA1570@backtop.namesys.com> <1078297355.31628.4.camel@titania.zlynx.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17030-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1078297355.31628.4.camel@titania.zlynx.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Alex Zarochentsev <zam@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Jonathan Briggs wrote:

>On Tue, 2004-03-02 at 22:35, Alex Zarochentsev wrote:
>  
>
>>Hello,
>>
>>On Tue, Mar 02, 2004 at 03:20:37PM -0700, Jonathan Briggs wrote:
>>    
>>
>>>I'm using Reiser4 on MD RAID 0.  I'm seeing blocks of zeros in files. 
>>>      
>>>
>>[ ... ]
>> 
>>    
>>
>>>So, any ideas?  Things you'd like to know?  Things you'd like me to try?
>>>      
>>>
>>What reiser4 snapshot are you using?  There were bugs related to md-devices
>>in the snapshots before 2004.02.25. 
>>    
>>
>
>The date I have on all.diff.gz is Feb 25.  I believe I downloaded it the
>day the new snapshot was announced.
>
>It might be nifty if Reiser4 exported its build version in
>/sys/fs/reiser4 somewhere.  If it is there I did not see it.
>  
>
It is a nice thought, but once we are in the kernel we will be just 
using the kernel version numbers.....

-- 
Hans


