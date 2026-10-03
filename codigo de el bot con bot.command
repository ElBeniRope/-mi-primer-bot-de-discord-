import discord
from discord.ext import commands
import random
import string


def gen_pass(length):
    characters = string.ascii_letters + string.digits + string.punctuation
    return ''.join(random.choice(characters) for _ in range(length))


intents = discord.Intents.default()
intents.message_content = True

bot = commands.Bot(command_prefix='$', intents=intents)

@bot.event
async def on_ready():
    print(f'{bot.user} has logged in!')

@bot.command()
async def hello(ctx):
    await ctx.send(f'Hola, soy {bot.user}!')

@bot.command()
async def heh(ctx, count_heh = 5):
    await ctx.send("he" * count_heh)

@bot.command()
async def bye(ctx):
    await ctx.send("\U0001f642")

@bot.command()
async def broma(ctx):
    await ctx.send("¿Qué le dice una taza a otra taza?, ¿Que tazaciendo?")

@bot.command()
async def flip(ctx):
    await ctx.send("flipping a coin...")
    await ctx.send("Heads" if random.randint(0, 1) == 0 else "Tails")

@bot.command()
async def password(ctx):
    length = int(input("enter the length of the password: "))
    password = gen_pass(length)
    await ctx.send(f"Your password is: {password}")



bot.run("tu token")
