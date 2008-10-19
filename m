From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [BUG] reiser4-for-2.6.27
Date: Sun, 19 Oct 2008 22:53:26 +0400
Message-ID: <48FB8226.3080301@gmail.com>
References: <9bb377710810181808w5bb8b512l24cf7db8ddfcebaf@mail.gmail.com> <b8d16a880810190157i3dd52b1eof2658d9a4771a8eb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <b8d16a880810190157i3dd52b1eof2658d9a4771a8eb@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christopher Sawtell <csawtell@gmail.com>
Cc: Brandon Berhent <cheater1034@gmail.com>, reiserfs-devel@vger.kernel.org

Christopher Sawtell wrote:
> 2008/10/19 Brandon Berhent <cheater1034@gmail.com>:
>   
>> Hi, i've  been reported problems with 2 people i know who have used
>> the reiser4-for-2.6.27 patch (the only people i know who have used
>> it). I have not got around to trying it myself however.
>>     
>
> Did they report any damage to the file system?
>   

It may result in wrong dirty memory accounting,
not in file system damage..

> If not, I could I could give it a spin too.
>
> I'm currently on 2.6.25.10 which works well except it 'hibernates'
> from time to time when copying large files.
>
>   

