From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re:
Date: Tue, 08 Apr 2008 14:00:54 +0400
Message-ID: <47FB4256.6070804@gmail.com>
References: <b8d16a880804071436i1c658f52qea7950ec1307208b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <b8d16a880804071436i1c658f52qea7950ec1307208b@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christopher Sawtell <csawtell@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Christopher Sawtell wrote:

>Has anybody any idea, however vague, as to how many Reiser4 instances
>are running in critical or business situations?
>
>  
>

It seems the set of instances is empty..

I hope there will be the first one soon: one Russian
business company is interested in a fileserver over Reiser4.

Quite frankly, there can be system lockups when serving
a lot of clients: I've found unaddressed deadlocky artifacts
pointed by akpm..

>Also with the cryptographic plugin?
>  
>

It works :) I had a cryptcompress partition encrypted with
a hardcoded aes key in a simple ebc-mode. All we need is
a sane iv-generator and a key manager. Perhaps, it will be
implemented as a part of the mentioned project..

Edward.
