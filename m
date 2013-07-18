From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [PATCH] reiserfs: check/extend buffer length for printing functions
Date: Thu, 18 Jul 2013 15:29:17 +0800
Message-ID: <51E7994D.1060300@asianux.com>
References: <51E65A68.8070009@asianux.com> <51E76ED7.303@asianux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51E76ED7.303@asianux.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Al Viro <viro@zeniv.linux.org.uk>, George Spelvin <linux@horizon.com>
Cc: reiserfs-devel@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On 07/18/2013 12:28 PM, Chen Gang wrote:
>  
>>  	strcpy(fmt1, fmt);
>> @@ -199,46 +214,51 @@ static void prepare_error_buf(const char *fmt, va_list args)
>>  	while ((k = is_there_reiserfs_struct(fmt1, &what)) != NULL) {
>>  		*k = 0;
>>  
>> -		p += vsprintf(p, fmt1, args);
>> +		p += vsnprintf(p, left, fmt1, args);

At least, need use vscnprintf() instead of vsnprintf(), since we need
the real written length return.

>> +		left = REISERFS_ERR_BUF_LEFT(p, error_buf);
>>  
>>  		switch (what) {
>>  		case 'k':
>> -			sprintf_le_key(p, va_arg(args, struct reiserfs_key *));
>> +			sprintf_le_key(p, left,
>> +				       va_arg(args, struct reiserfs_key *));
>>  			break;
>>  		case 'K':
>> -			sprintf_cpu_key(p, va_arg(args, struct cpu_key *));
>> +			sprintf_cpu_key(p, left,
>> 


-- 
Chen Gang
