"""empty message

Revision ID: ae7bc6b9d1b3
Revises: 
Create Date: 2020-08-03 19:35:46.829600

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'ae7bc6b9d1b3'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('categoria',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('nombre', sa.String(length=64), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_categoria_nombre'), 'categoria', ['nombre'], unique=False)
    op.create_table('user',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('username', sa.String(length=64), nullable=True),
    sa.Column('email', sa.String(length=120), nullable=True),
    sa.Column('password_hash', sa.String(length=128), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_user_email'), 'user', ['email'], unique=True)
    op.create_index(op.f('ix_user_username'), 'user', ['username'], unique=True)
    op.create_table('post',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('body', sa.String(length=140), nullable=True),
    sa.Column('timestamp', sa.DateTime(), nullable=True),
    sa.Column('user_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['user_id'], ['user.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_post_timestamp'), 'post', ['timestamp'], unique=False)
    op.create_table('producto',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('nombre', sa.String(length=100), nullable=True),
    sa.Column('stock', sa.Integer(), nullable=True),
    sa.Column('precio', sa.Numeric(precision=10, scale=2), nullable=True),
    sa.Column('categoria_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['categoria_id'], ['categoria.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_producto_nombre'), 'producto', ['nombre'], unique=False)
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_index(op.f('ix_producto_nombre'), table_name='producto')
    op.drop_table('producto')
    op.drop_index(op.f('ix_post_timestamp'), table_name='post')
    op.drop_table('post')
    op.drop_index(op.f('ix_user_username'), table_name='user')
    op.drop_index(op.f('ix_user_email'), table_name='user')
    op.drop_table('user')
    op.drop_index(op.f('ix_categoria_nombre'), table_name='categoria')
    op.drop_table('categoria')
    # ### end Alembic commands ###
